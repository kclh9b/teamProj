package dog.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dog.mapper.SettleMapper;
import dog.model.SettleVO;

@Controller
public class SettelController_Backup {
/*
	@Resource
	SettleMapper sm;
	
	@RequestMapping("/adminSettle")
	String adminSettle(HttpSession session, Model mm, @RequestParam(value="sch", defaultValue="") String sch) {
		String id= (String)session.getAttribute("uid");
		if(!id.equals("admin")) {
			mm.addAttribute("msg", "관리자만 접속할 수 있습니다.");
			mm.addAttribute("url", "/");
			return "alert";
		}
		
		if(sch.contains("d")) {
			if(sch.contains("7")) {
				mm.addAttribute("list",sm.viewDay("7"));
			}else if(sch.contains("15")) {
				mm.addAttribute("list",sm.viewDay("15"));
			}else {
				mm.addAttribute("list",sm.viewDay("30"));
			}
		}else if(sch.contains("m")) {
			
			if(sch.equals("m1")) {
				mm.addAttribute("list",sm.viewMonth("1"));
				System.out.println("진입");
			}else if(sch.contains("3")) {
				mm.addAttribute("list",sm.viewMonth("3"));
			}else if(sch.contains("6")) {
				mm.addAttribute("list",sm.viewMonth("6"));
			}else if(sch.contains("12")) {
				mm.addAttribute("list",sm.viewMonth("12"));
			}
			
		}else if(sch.contains("y")){
			if(sch.equals("y1")) {
				mm.addAttribute("list",sm.viewYear("1"));
			}else if(sch.contains("3")) {
				mm.addAttribute("list",sm.viewYear("3"));
			}else if(sch.contains("5")) {
				mm.addAttribute("list",sm.viewYear("5"));
			}else if(sch.contains("10")) {
				mm.addAttribute("list",sm.viewYear("10"));
			}else {
				mm.addAttribute("list",sm.viewYear("50"));
			}
		}else {
			
		}
		
		SettleVO sv = sm.checkoutByDay();
		if(sv==null) {
			sv = new SettleVO();
			sv.setPay(0);
		}
		mm.addAttribute("day",sv);
		
		sv = sm.checkoutByWeek();
		if(sv==null) {
			sv = new SettleVO();
			sv.setPay(0);
			mm.addAttribute("week",sv);
		}
		mm.addAttribute("week",sv);
		
		sv = sm.checkoutByMonth();
		if(sv==null) {
			sv = new SettleVO();
			sv.setPay(0);
			mm.addAttribute("month",sv);
		}
		mm.addAttribute("month",sv);
		
		sv = sm.checkoutByMonth();
		if(sv==null) {
			sv = new SettleVO();
			sv.setPay(0);
			mm.addAttribute("year",sv);
		}
		mm.addAttribute("year",sv);
		
		return "settlement";
	}*/
}
