package service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

public class WaferCheck {
	private static WaferCheck wCheck;
	private static double minAllowalbeValue = 4.135;
	private static double maxAllowalbeValue = 4.166;

	private WaferCheck() {

	}

	public static synchronized WaferCheck getInstant() {
		if (wCheck == null) {
			wCheck = new WaferCheck();
		}
		return wCheck;
	}

	public double[] txtRead(String name) {
		StringTokenizer st = null;
		BufferedReader reader = null;

		
		//C:/eclipse-workspace/Tmax_project/src/main/webapp/download/
		//C:/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Tmax_project/download/
		
		File file = new File("C:/eclipse-workspace/Tmax_project/src/main/webapp/download/" + name);
		String filePath = file.getPath();

		try {
			reader = new BufferedReader(new FileReader(filePath));
			String row = null;
			int cnt = 0;

			double measure[] = new double[25];

			while ((row = reader.readLine()) != null) {
				measure[cnt] = Double.parseDouble(row);
				cnt++;
			}
			return measure;
		} catch (IOException e) {
			System.out.println("File read error!");
			e.printStackTrace();
		} finally {
			try {
				if (reader != null) {
					reader.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

//	public ArrayList fullSectorMeasure(double[] measure) {
//		ArrayList fullSector = new ArrayList();
//		
//		for (int i = 0; i < 25; i++) {
//			fullSector.add(i);
//		}
//		return fullSector;
//	}

	public HashMap<String, Double> fullSectorMeasure(double[] measure) {

		HashMap<String, Double> fullSector = new HashMap<String, Double>();

		for (int i = 0; i < 25; i++) {
			fullSector.put(Integer.toString(i), measure[i]);
		}
		return fullSector;
	}

//	public ArrayList errSectorMeasure(double[] measure) {
//		ArrayList errSector = new ArrayList();
//		
//		for (int i = 0; i < 25; i++) {
//			if (measure[i] > maxAllowalbeValue || measure[i] < minAllowalbeValue) {
//				errSector.add("y");
//			} else {
//				errSector.add("n");
//			}
//		}
//		return errSector;
//	}

	public HashMap<String, String> errSectorMeasure(double[] measure) {

		HashMap<String, String> errSector = new HashMap<String, String>();

		for (int i = 0; i < 25; i++) {
			if (measure[i] > maxAllowalbeValue || measure[i] < minAllowalbeValue) {
				errSector.put(Integer.toString(i), "y");
			} else {
				errSector.put(Integer.toString(i), "n");
			}
		}
		return errSector;
	}

	public String checkErr(double[] measure) {
		String errExist;
		for (int i = 0; i < 25; i++) {
			if (measure[i] > maxAllowalbeValue || measure[i] < minAllowalbeValue) {
				errExist = "y";
				return errExist;
			}
		}
		errExist = "n";
		return errExist;
	}


}
