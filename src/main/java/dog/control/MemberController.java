package dog.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dog.domain.member.MemberMapp;
import dog.domain.board.CboardVO;
import dog.domain.member.MemberVO;
import dog.domain.board.QnaVO;
import dog.domain.board.ReviewVO;
@Controller
public class MemberController {
   
   
   @Resource
   MemberMapp mapper;

   @RequestMapping("/member/MemberList")
   ModelAndView list(MemberVO vo) {

      ModelAndView mav = new ModelAndView("member/MemberList");
      mav.addObject("memberData", mapper.mmList(vo));
      return mav;
   }
   
   @RequestMapping("/member/MyWriteList")
   ModelAndView writelist(CboardVO cvo, QnaVO qvo, ReviewVO rvo, HttpSession session) {
      ModelAndView mav = new ModelAndView("member/MyWriteList");
      cvo.setUid((String) session.getAttribute("uid"));
      rvo.setUid((String) session.getAttribute("uid"));
      qvo.setUid((String) session.getAttribute("uid"));
      mav.addObject("memberData", mapper.mmWrite1(cvo));
      mav.addObject("memberData2", mapper.mmWrite2(rvo));
      mav.addObject("memberData3", mapper.mmWrite3(qvo));
      return mav;
   }
   
   @RequestMapping("member/AdminModify")
   ModelAndView sel(MemberVO vo) {
      ModelAndView mav = new ModelAndView("member/AdminModify");
      mav.addObject("memberData", mapper.mmSelectMem(vo));
      return mav;
   }
   
   /*
    * @RequestMapping("member/AdminBlack") ModelAndView black(MemberVO vo) {
    * ModelAndView mav = new ModelAndView("member/AdminBlack");
    * mav.addObject("memberData", mapper.mmSelectMem(vo)); return mav; }
    */
   
   @RequestMapping("member/AdminModify2")
   ModelAndView sel2(MemberVO vo) {
      ModelAndView mav = new ModelAndView("member/AdminModify");
      mav.addObject("memberData", mapper.mmSelectMem(vo));
      return mav;
   }
   
   @RequestMapping("member/AdminModify3")
   String sel3(MemberVO vo) {
      mapper.mmAdminModify(vo);
      return "redirect:MemberList";
   }
   @RequestMapping("member/AdminBlack")
   ModelAndView black(MemberVO vo) {
      ModelAndView mav = new ModelAndView("member/AdminBlack");
      mav.addObject("memberData", mapper.mmSelectMem(vo));
      return mav;
   }
   
   @RequestMapping("member/AdminBlackA")
   String BA(MemberVO vo) {
      mapper.mmBlackA(vo);
      return "redirect:Mypage";
   }
   @RequestMapping("member/AdminBlackF")
   String BF(MemberVO vo) {
      mapper.mmBlackF(vo);
      return "redirect:Mypage";
   }
   
   @RequestMapping("/member/MemberListOne")
   ModelAndView listone(MemberVO vo, HttpSession session) {
      ModelAndView mav = new ModelAndView("member/MemberListOne");
      vo.setUid((String) session.getAttribute("uid"));
      mav.addObject("memberData", mapper.mmListOne(vo));
      return mav;
   }

   /* 회원가입은 몇몇 데이터 체크박스로 처리 예정 */
   @RequestMapping("/member/MemberReg")
   String write(MemberVO vo) {
      return "member/MemberReg";
   }


   @ResponseBody
   @RequestMapping(value="/idck")
   public int idck(MemberVO vo) throws Exception {
      
      int result = mapper.ckid(vo);
      return result;
   }
   
   @ResponseBody
   @RequestMapping(value="/emailck")
   public int emailck(MemberVO vo) throws Exception {
      int result = mapper.ckemail(vo);
      return result;
   }
   
   
   @RequestMapping("/member/MemberReg2")
   String Reg(MemberVO vo) throws Exception{
      int result;
      result = idck(vo);
      if(result==1) {
         return "/member/MemberReg";
      }
      ModelAndView mav = new ModelAndView("member/MemberReg");
      mav.addObject("memberData", mapper.mmInsert(vo));
      return "member/MemberLogin";
   }

   @RequestMapping("/member/MemberSearchID")
   String searchid() {
      return "member/MemberSearchID";
   }

   @RequestMapping("/member/MemberSearchIDpro")
   ModelAndView searchid2(MemberVO vo) {
      ModelAndView mav = new ModelAndView("member/MemberSearchIDpro");
      mav.addObject("memberData", mapper.mmsearchid(vo));
      return mav;
   }
   
   @RequestMapping("/member/MemberSearchPW")
   String searchpw() {
      return "member/MemberSearchPW";
   }
   

   @RequestMapping("/member/info")
   String info() {
      return "member/info";
   }
   
   
   
   @RequestMapping("/member/MemberSearchPWpro")
   ModelAndView searchpw2(MemberVO vo) {
      ModelAndView mav = new ModelAndView("member/MemberSearchPWpro");
      mav.addObject("memberData", mapper.mmsearchpw(vo));
      return mav;
   }
   
   
   /* 로그인은 추후 서비스쪽으로 편입해서 처리 */
   @RequestMapping("/member/MemberLogin")
   String login(HttpSession session) {
      if (session.getAttribute("uid") != null) {
         return "member/Mypage";
      }
      session.invalidate();
      return "member/MemberLogin";
   }
   
   
   @RequestMapping("/member/Mypage")
   ModelAndView Main(MemberVO vo, HttpSession session) {
      ModelAndView mav = new ModelAndView("member/Mypage");
      mav.addObject("memberData", mapper.mmLogin(vo));
      vo.setUid((String) session.getAttribute("uid"));
      mav.addObject("memberData2", mapper.mmListOne(vo));
      return mav;
   }
   
   
   @RequestMapping("/member/MemberLoginReg")
   ModelAndView Login2(MemberVO vo, HttpSession session, Model mm) {
      ModelAndView mav = new ModelAndView("alert");
      mav.addObject("memberData", mapper.mmLogin(vo));
      
      try {
         if(mapper.mmLogin(vo).getUid().equals(vo.getUid())) {
         session.setAttribute("uid", vo.getUid());
         session.setAttribute("name", mapper.mmLogin(vo).getName());
         session.setAttribute("passwd", mapper.mmLogin(vo).getPasswd());
         session.setAttribute("access", mapper.mmLogin(vo).getAccess());
         session.setAttribute("email", mapper.mmLogin(vo).getEmail());
         session.setAttribute("phn", mapper.mmLogin(vo).getPhn());
         session.setAttribute("available", mapper.mmLogin(vo).getAvailable());
         session.setAttribute("black", mapper.mmLogin(vo).getBlack());
         session.setAttribute("fur", mapper.mmLogin(vo).getFur());
         session.setAttribute("size", mapper.mmLogin(vo).getSize());
         session.setAttribute("age", mapper.mmLogin(vo).getAge());
         session.setAttribute("weight", mapper.mmLogin(vo).getWeight());
         String n = "n";
            if(n.equals((String)session.getAttribute("available"))) {
               session.invalidate();
               mav.addObject("msg", "탈퇴된 회원입니다.");
               mav.addObject("url", "MemberLogin");
               return mav;
            } 
            
            /*
            if((char)session.getAttribute("black")=='y') {
               session.invalidate();
               System.out.println("블랙리스트 회원");
               return "redirect:MemberLogin";
            }
            */
            mav.addObject("msg", "로그인 성공.");
            mav.addObject("url", "/");
            return mav;
            
         }else { 
            mav.addObject("msg", "아이디 또는 패스워드를 확인하세요!");
            mav.addObject("url", "MemberLogin");
            return mav;
         }
      } catch (Exception e) {
         mav.addObject("msg", "아이디 또는 패스워드를 확인하세요!");
         mav.addObject("url", "MemberLogin");
         return mav;
      }
      
      
   }
   
   
   @RequestMapping("/member/MemberLogout")
   String Logout(MemberVO vo, HttpSession session) {
      session.invalidate();
      return "redirect:/";
   }

   
   
   @RequestMapping("/member/MemberDelete")
   ModelAndView Del(MemberVO vo, HttpSession session) {
      ModelAndView mav = new ModelAndView("member/MemberDelete");
      vo.setUid((String) session.getAttribute("uid"));
      mav.addObject("memberData", mapper.mmListOne(vo));
      return mav;
   }

   @RequestMapping("/member/MemberDelete2")
   String Delete(MemberVO vo, HttpSession session) {
      ModelAndView mav = new ModelAndView("member/MemberDelete");
      if (vo.getUid().equals(session.getAttribute("uid")) && vo.getPasswd().equals(session.getAttribute("passwd"))) {
         mav.addObject("memberData", mapper.mmDelete(vo));
      }
      session.invalidate();
      return "member/MemberLogin";
   }

   @RequestMapping("/member/MemberModify")
   ModelAndView modify(MemberVO vo, HttpSession session) {
      ModelAndView mav = new ModelAndView("member/MemberModify");
      vo.setUid((String) session.getAttribute("uid"));
      mav.addObject("memberData", mapper.mmListOne(vo));
      return mav;
   }
   
   @RequestMapping("/member/ChangePasswd")
   ModelAndView modifypw(MemberVO vo, HttpSession session) {
      ModelAndView mav = new ModelAndView("member/ChangePasswd");
      vo.setUid((String) session.getAttribute("uid"));
      mav.addObject("memberData", mapper.mmListOne(vo));
      return mav;
   }
   
   @RequestMapping("/member/ChangePasswd2")
   String modifypw2(MemberVO vo, HttpSession session) {
      ModelAndView mav = new ModelAndView("member/ChangePasswd");
      vo.setUid((String) session.getAttribute("uid"));
      mav.addObject("memberData", mapper.mmModifyps(vo));
      return "redirect:Mypage";
   }
   
   @RequestMapping("/member/MemberModify2")
   String modfiy2(MemberVO vo, HttpSession session) {
      vo.setUid((String) session.getAttribute("uid"));
      ModelAndView mav = new ModelAndView("member/MemberModify");
      mav.addObject("memberData", mapper.mmModify(vo));
      return "redirect:Mypage";
   }

   
}