package dog.control;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dog.domain.settle.mapper.SettleMapper;
import dog.domain.item.ItemVO;
import dog.domain.settle.SettleSchCondition;
import dog.domain.settle.SettleVO;

@Controller
public class SettelController {

	@Resource
	SettleMapper sm;
	
	@RequestMapping("/adminSettle")
	String adminSettle(HttpSession session, Model mm, SettleSchCondition scc) {
		String id= (String)session.getAttribute("uid");
		
		if(!id.equals("admin")) {
			mm.addAttribute("msg", "관리자만 접속할 수 있습니다.");
			mm.addAttribute("url", "/");
			return "alert";
		}
		
		
		Map<String, Object> map = new HashMap();
		map.put("cateid", scc.getCateid());
		map.put("keyword", scc.getKeyword());
		map.put("schKind", scc.getSchKind());
		
		if(!(scc.getStart() == null || scc.getStart().equals(""))) {
			mm.addAttribute("start", scc.getStart());
		}
		if(!(scc.getEnd() == null || scc.getEnd().equals(""))) {
			mm.addAttribute("end", scc.getEnd());
		}
		if(scc.getStandard()!=null) {
			mm.addAttribute("standard", scc.getStandard());			
			if(scc.getStandard().equals("day")) {
				map.put("start", scc.getStart());
				map.put("end", scc.getEnd());
				ArrayList<SettleVO> svl1 = sm.viewDay(map);
				ArrayList<SettleVO> svl2 = new ArrayList<>();
				for(int i=0; i<svl1.size(); i++) {
					svl2.add(svl1.get(i));
				}				
				Collections.reverse(svl2);
				mm.addAttribute("list", svl1);
				mm.addAttribute("list2", svl2);
			}else if (scc.getStandard().equals("month")) {
				map.put("start", scc.getStart().substring(0,7));
				map.put("end", scc.getEnd());
				ArrayList<SettleVO> svl1 = sm.viewMonth(map);
				ArrayList<SettleVO> svl2 = new ArrayList<>();
				for(int i=0; i<svl1.size(); i++) {
					svl2.add(svl1.get(i));
				}				
				Collections.reverse(svl2);
				mm.addAttribute("list", svl1);
				mm.addAttribute("list2", svl2);
			}else if (scc.getStandard().equals("year")) {
				map.put("start", scc.getStart().substring(0,4));
				map.put("end", scc.getEnd());
				ArrayList<SettleVO> svl1 = sm.viewYear(map);
				ArrayList<SettleVO> svl2 = new ArrayList<>();
				for(int i=0; i<svl1.size(); i++) {
					svl2.add(svl1.get(i));
				}				
				Collections.reverse(svl2);
				mm.addAttribute("list", svl1);
				mm.addAttribute("list2", svl2);
				
			}
		}
		
		
		String gname = "";
		String sname = "";
		
		if(scc.getKeyword()!=null) {
			ItemVO iv = sm.getInfoByKeyword(scc);
			if(iv!=null) {
				mm.addAttribute("name", iv.getName());
				mm.addAttribute("cateid", iv.getGname()+" - "+iv.getSname());				
			}else {
				mm.addAttribute("name", "-");
				mm.addAttribute("cateid", "-");				
			}
		}else {
			mm.addAttribute("name","전체");
			if(scc.getCateid()!=null) {
				if(scc.getCateid().contains("_")) {
					ItemVO iv = sm.getGnameByCateid(scc);
					gname = iv.getGname();
					mm.addAttribute("cateid", gname+sname);					
				}else {
					ItemVO iv = sm.getGnameSnameByCateid(scc);
					gname = iv.getGname();
					sname = " - "+iv.getSname();
					mm.addAttribute("cateid", gname+sname);
				}
			}else {
				gname = "전체";
				mm.addAttribute("cateid", gname+sname);
			}
		}
		
		
		
		return "settle/settlement";
	}
}
