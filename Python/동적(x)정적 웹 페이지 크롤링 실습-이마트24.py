from selenium import webdriver
from bs4 import BeautifulSoup
import pandas as pd
import datetime
import time


# 크롬으로 실행하도록 설정
wd = webdriver.Chrome()
# 결과를 저장할 리스트 변수 선언
result = []
# 매개변수 url로 크롬 브라우저를 열어주는 코드
wd.get("https://emart24.co.kr/store")
# 페이지 로딩 시간을 기다리는 코드
time.sleep(1)
# 페이지의 html코드를 변수에 저장
html = wd.page_source
# html의 태그들을 사용할 수 있도록 변경

        
soupCB = BeautifulSoup(html, 'html.parser')

store_list = soupCB.select("li.searchResult")

for store in store_list:
    # 매장번호
    store_no = store["data-store_code"]

    # 이름
    store_name_tag = store.select_one("div.titleWrap > span.title")
    store_name = store_name_tag.string
    
    # 주소/전화번호
    places = store.select("div.resultContents > div.place")
    
    # 주소
    address = places[0].span.string
    
    # 전화번호
    phone = places[1].select("span")[1].string if places[1].select("span") else ""
    
    print(store_no, store_name, address, phone)

    result.append([store_no, store_name, address, phone])

    print(result)



# pandas를 사용한 csv저장
CB_tbl = pd.DataFrame(result, columns=('no','store_name','address','phone'))
CB_tbl.to_csv("Emart24.csv", encoding="utf-8", mode="w", index=True)




'''구조
<div class="resultContents">
    <div class="place"><span>서울특별시 성동구 광나루로 310 푸조비즈타워 101호</span></div> -> places[0], places[0].span -> 무조건 1번째 span
    <div class="place" style="height: 16.8px; display: flex; allign-items: center;"> 
        <span class="icon"><img src="/assets/assets/imgs/telFillIcon.png" alt="전화아이콘" style="height: 16px;" /></span>  -> places[1].select("span")[0]
        &nbsp;
        <span style="font-weight: bold; line-height: 19px;">070-7700-9596</span> -> places[1].select("span")[1] -> 2번째 이후, 내지는 마지막 span
    </div>

'''