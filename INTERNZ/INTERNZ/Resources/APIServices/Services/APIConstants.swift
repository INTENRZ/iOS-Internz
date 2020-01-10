//
//  APIConstants.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation

struct APIConstants {
    
    static let BaseURL = "http://34.97.205.14:3000"
    
    /* 유저 정보 */
    static let Signup1URL = BaseURL +  "/user/signup1" // 회원가입1 - 이메일 중복 체크
    static let Signup2URL = BaseURL + "/user/signup2" // 회원가입2 - 최종
    static let loginURL = BaseURL + "/user/signin" // 로그인
    static let taskIntroURL = BaseURL + "/user/taskandintro" // 관심 직군 및 한 줄 소개 및 프로필 작성
    static let nicknameURL = BaseURL + "/nickname" // 닉네임 조회
    
    
    /* 타임라인 */
    static let profileTimelineURL = BaseURL + "/timeline/list" // 프로필 타임라인 조회
    static let profileTimelineUDURL = BaseURL + "/timeline" // 프로필 타임라인 삭제 + 수정 + 작성
    static let timelineStoryURL = BaseURL + "/timeline/" // 타임라인 스토리 조회
    
    
    /* 스토리 + 댓글 */
    static let storyNewURL = BaseURL + "/story/new" // 스토리 최신순 조회
    static let storyCountURL = BaseURL + "/story/count" // 스토리 조회순 조회
    static let storyDetailURL = BaseURL + "/story/" // 스토리 내용 조회 + 댓글 조회/생성/수정
    static let storyCategorySortURL = BaseURL + "/story/category/sort" // 스토리 카테고리 설정 후 조회순/최신순 조회
    
    
    /* 프로필 */
    static let profileListURL = BaseURL + "/profile/list" // 프로필 조회
    static let profileIntroduceEditURL = BaseURL + "/profile/intro" // 한 줄 소개 수정
    
    
    /* 쪽지 */
    static let letterPeopleListURL = BaseURL + "/letter/others"  // 쪽지 주고 받은 사람 목록
    static let letterDetailURL = BaseURL + "/letter/others/message" // 특정 사람과의 쪽지 내용
    static let letterSendURL = BaseURL + "letter/others" // 쪽지 보내기
    
    
    /* 공고 */
    static let jobURL = BaseURL + "/job" // 공고 전체 조회
    static let jobPastURL = BaseURL + "/job/past" // 지난 공고 조회
    static let jobFilterURL = BaseURL + "/job/" // 공고 필터 조회
    
    
    /* 메인 */
    static let homeURL = BaseURL + "/home" // 메인 홈
    
    /* 팔로우 */
    static let profileFollowerURL = BaseURL + "/profile/follower" // 팔로워 리스트
    static let profileFollowingURL = BaseURL + "/profile/following" // 팔로잉 리스트 , 팔로우 하기 , 팔로우 취소
    
    
    /* 캘린더 */
    static let calenderURL = BaseURL + "/calender/home/2020-01" // 캘린더 홈 조회
    static let calenderDayURL = BaseURL + "/calender/" // 날짜별 공고 조회 + 삭제 + 추가
    
    
}
