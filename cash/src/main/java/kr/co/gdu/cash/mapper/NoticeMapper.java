package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper // public class NoticeMapperImpl implements NoticeMapper{}
public interface NoticeMapper {
	
	
	//공지리스트
	List<Map<String,Object>> selectNoticeListByPage(Map<String, Integer> map);
	//공지 추가
	int insertNotice(Notice notice);
	//공지 총 개수 구하기
	int countNoticeList();
	//공지사항 상세보기
	Notice selectNoticeOneById(int noticeId);	
	//공지사항 삭제
	int deleteNoticeOneById(int noticeId);
	//공지사항 수정
	int updateNoticeOne(Notice notice);
}
