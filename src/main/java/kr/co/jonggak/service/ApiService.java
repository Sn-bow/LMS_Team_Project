package kr.co.jonggak.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.dao.ApiDao;
import kr.co.jonggak.dto.MyclassDto;

@Service
public class ApiService {
	@Autowired
	private ApiDao apidao;

	public List<MyclassDto> getClasses(int year, int semester, String id) {
		List<MyclassDto> MyclaList = new ArrayList<MyclassDto>();
		if (id.substring(0, 1).equals("S")) {
			MyclaList = apidao.getClassesS(year, semester, id);
		} else if (id.substring(0, 1).equals("P")) {
			MyclaList = apidao.getClassesP(year, semester, id);
		}
		System.out.println(MyclaList);
		for (MyclassDto a : MyclaList) {
			if (a.getCla_open().equals("09:00")) {
				a.setCla_openint(1);
			} else if (a.getCla_open().equals("10:00")) {
				a.setCla_openint(2);
			} else if (a.getCla_open().equals("11:00")) {
				a.setCla_openint(3);
			} else if (a.getCla_open().equals("12:00")) {
				a.setCla_openint(4);
			} else if (a.getCla_open().equals("13:00")) {
				a.setCla_openint(5);
			} else if (a.getCla_open().equals("14:00")) {
				a.setCla_openint(6);
			} else if (a.getCla_open().equals("15:00")) {
				a.setCla_openint(7);
			} else if (a.getCla_open().equals("16:00")) {
				a.setCla_openint(8);
			} else if (a.getCla_open().equals("17:00")) {
				a.setCla_openint(9);
			} else if (a.getCla_open().equals("18:00")) {
				a.setCla_openint(10);
			}

			if (a.getCla_close().equals("10:00")) {
				a.setCla_closeint(1);
			} else if (a.getCla_close().equals("11:00")) {
				a.setCla_closeint(2);
			} else if (a.getCla_close().equals("12:00")) {
				a.setCla_closeint(3);
			} else if (a.getCla_close().equals("13:00")) {
				a.setCla_closeint(4);
			} else if (a.getCla_close().equals("14:00")) {
				a.setCla_closeint(5);
			} else if (a.getCla_close().equals("15:00")) {
				a.setCla_closeint(6);
			} else if (a.getCla_close().equals("16:00")) {
				a.setCla_closeint(7);
			} else if (a.getCla_close().equals("17:00")) {
				a.setCla_closeint(8);
			} else if (a.getCla_close().equals("18:00")) {
				a.setCla_closeint(9);
			} else if (a.getCla_close().equals("19:00")) {
				a.setCla_closeint(10);
			}
		}
		return MyclaList;
	}

}
