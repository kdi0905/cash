package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	int insertNoticefile(Noticefile noticefile);
	int deleteNoticefileOne(int noticefileId);
	int deleteNoticefileAll(int noticeId);
	Noticefile selectNoticefileOne(int noticefileId);
}
