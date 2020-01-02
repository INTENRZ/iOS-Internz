//
//  APIConstants.swift
//  INTERNZ
//
//  Created by 최은지 on 24/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation

struct APIConstants {
    
    static let BaseURL = "http://34.97.246.7:3000"
    
    // 유저 정보
    static let Signup1URL = BaseURL +  "/user/signup1" // 회원가입1 - 이메일 중복 체크
    static let Signup2URL = BaseURL + "/user/signup2" // 회원가입2 - 최종
    static let taskURL = BaseURL + "/user/task" // 관심 직군 등록
    static let introduceURL = BaseURL + "/user/introduce" // 한 줄 소개 + 프로필사진
    static let nicknameURL = BaseURL + "/user/nickname" // 닉네임
    static let loginURL = BaseURL + "/user/signin" // 로그인
    
    
    
    // 프로필
    static let profileIntroduceEditURL = BaseURL + "/profile/intro"
    static let profileFavorEditURL = BaseURL + "/profile/task"
    
    static let profileListURL = BaseURL + "/profile/list"
    
    static let profileFollowerURL = BaseURL + "/profile/follower" // 팔로워
    static let profileFollowingURL = BaseURL + "/profile/following" // 팔로잉
    
    static let letterPeopleListURL = BaseURL + "/letter/others"
    
    static let timelineStoryURL = BaseURL + "/timeline/" // 타임라인 스토리 조회
    
    
    // 캘린더
    static let calenderURL = BaseURL + "/calender/home/2020-01"
    
    
    
    // 타임라인
    static let profileTimelineURL = BaseURL + "/timeline/list"
    
    
    
    // 공고
    static let jobURL = BaseURL + "/job"
    
    
    // 스토리
    static let storyNewURL = BaseURL + "/story/new" // 스토리 최신순 조회
    static let storyCountURL = BaseURL + "/story/count" // 스토리 조회순 조회
    static let storyDetailURL = BaseURL + "/story/" // 스토리 내용 조회
    
    
    
}
