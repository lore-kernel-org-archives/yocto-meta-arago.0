Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 575B1529EC
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 15:03:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UF23wn116528
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 10:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572447723;
	bh=RCqqGx8HEd43q55f4VUi21SIqAD84/Zq/3QeyNVaQ8c=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Z4WQxIXE0UZMU5cfe9lxGcooPAfYROBNouChX6YiIQlJe3vW/KCjVSPn/UinLIRaO
	9wxKt6rft4ebL8QI9cuA1FOIxDlQb2sB09IRyI3hcEU/zqjfld8HiZcCtWVMKVkFNz
	BCa5urIs1c4k+Slemtv5SXUwnbZN05oCcE6mn/eI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UF22aH128381
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 10:02:03 -0500
Received: from [158.218.113.148] (158.218.113.148) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 10:01:46 -0500
To: Denys Dmytriyenko <denys@ti.com>, Eric Ruei <e-ruei1@ti.com>
References: <20191029135349.31792-1-e-ruei1@ti.com>
	<20191029135349.31792-5-e-ruei1@ti.com> <20191029211300.GI7518@beryl>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <184904fe-ba3f-48b0-c643-9ae069ca224b@ti.com>
Date: Wed, 30 Oct 2019 11:01:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029211300.GI7518@beryl>
X-Originating-IP: [158.218.113.148]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DLEE113.ent.ti.com
	(157.170.170.24)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/7] HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2019 15:03:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/29/2019 5:13 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 29, 2019 at 09:53:46AM -0400, Eric Ruei wrote:
>> This is a tentative workaround due to unclean qtwebkit build procedure
>> where khrplatform.h under both sysroot/usr/include and 3rdparty/ANGLE
>> is used.
>>
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 28 +++++++++++++++++++
>>   .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
>>   2 files changed, 30 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
>>
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
>> new file mode 100644
>> index 00000000..c6022ef6
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
>> @@ -0,0 +1,28 @@
>> +From c969fa7eedb3bce04c8f48caf469a46361437aa7 Mon Sep 17 00:00:00 2001
>> +From: Eric Ruei <e-ruei1@ti.com>
>> +Date: Fri, 30 Aug 2019 17:41:13 -0400
>> +Subject: [PATCH] HACK: ANGLE/khrplatform.h: add #define
>> + MESA_EGL_NO_X11_HEADERS
>> +
>> +Note: Only the KHR/khrplatform.h at sysroot/usr/include should be used.
>> +      This patch is a tentative workaround to make both files compatible
> 
> Upstream-Status: Inappropriate [reason]
> 
> 

Thanks! I should fix this at v2.

Eric


>> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> +---
>> + Source/ThirdParty/ANGLE/include/KHR/khrplatform.h | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
>> +index c9e6f17d3..4e3ff69a8 100644
>> +--- a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
>> ++++ b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
>> +@@ -279,4 +279,6 @@ typedef enum {
>> +     KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
>> + } khronos_boolean_enum_t;
>> +
>> ++#define MESA_EGL_NO_X11_HEADERS
>> ++
>> + #endif /* __khrplatform_h_ */
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
>> index 75213487..1dbe40d1 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
>> @@ -6,9 +6,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>   
>>   SRC_URI += " \
>>   	file://GraphicsSurfaceGL_NoX.cpp.patch \
>> +	file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch \
>>   "
>>   
>> -PR_append = ".arago7"
>> +PR_append = ".arago8"
>>   
>>   EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
>>   
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


