Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 887AA52BB4
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 20:31:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135KVOaD091159;
	Mon, 5 Apr 2021 15:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617654684;
	bh=t5RkbzxAqh2HexT8gsuF5KZrOZSLJc90fg0flq7iRfE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=KWyD8lV6i7Nj9El+2oFDlbzZzlhqk1CFpjK6cLNqWx7ZNszcqUrHIU8NfRQ1KQm1+
	dRaLbNIjQE7Pc3evPScJZ5Rx3+a3apJ4hYvw9EygbsmZ3kbaHipP6Po0OcG7bOTiam
	52jsLSuFEkI1Jdio4qYiCWmEBOsx5UfkWW0gQVxg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135KVNtF129810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 15:31:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 5 Apr 2021 15:31:23 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Mon, 5 Apr 2021 15:31:23 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [dunfell][PATCH 2/3] qtwebkit: Fix
	no X11 build
Thread-Index: AQHXJ3NiUMjsjUzSM0mjQMDcnwfMk6qmZkAQ
Date: Mon, 5 Apr 2021 20:31:23 +0000
Message-ID: <baa7642d9b174119bf93e0559e522750@ti.com>
References: <20210401163340.12248-1-g-tammana@ti.com>
	<20210401163340.12248-3-g-tammana@ti.com>
	<20210402035048.GT23013@denix.org>
In-Reply-To: <20210402035048.GT23013@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"denys@konsulko.com" <denys@konsulko.com>, "Bhargav,
	Krunal" <k-bhargav@ti.com>
Subject: Re: [EXTERNAL] Re: [dunfell][PATCH 2/3] qtwebkit: Fix no X11 build
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
X-List-Received-Date: Mon, 05 Apr 2021 20:31:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Denys Dmytriyenko <denis@denix.org>
>Sent: Thursday, April 01, 2021 10:51 PM
>To: Tammana, Gowtham <g-tammana@ti.com>
>Cc: meta-arago@arago-project.org; Bajjuri, Praneeth <praneeth@ti.com>;
>denys@konsulko.com; Bhargav, Krunal <k-bhargav@ti.com>
>Subject: [EXTERNAL] Re: [meta-arago] [dunfell][PATCH 2/3] qtwebkit: Fix no
>X11 build
>
>On Thu, Apr 01, 2021 at 11:33:39AM -0500, Gowtham Tammana wrote:
>> qtwebkit build is failing to set EGL_NO_X11 on platforms with no x11
>> support causing below failure.
>>
>> ```{.package=3Dqtwebkit .version=3Ddunfell}
>> In file included from
>> tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-
>linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-
>sysroot/usr/include/EGL/egl.h:39,
>>                 from tisdk/build/arago-tmp-external-arm-
>glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-
>r0.arago7/git/Source/WebCore/platform/graphics/opengl/Extensions3DOpenGLES
>.cpp:36:
>> tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-
>linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-
>sysroot/usr/include/EGL/eglplatform.h:134:10: fatal error: X11/Xlib.h: No
>such file or directory
>>   134 | #include <X11/Xlib.h>
>>       |          ^~~~~~~~~~~~
>> compilation terminated.
>> ```
>>
>> Setting up the flag EGL_NO_X11 when X11 target is enabled.
>
>Typo? enabled or disabled?

Typo indeed. Pushing v2.

Thanks,
Gowtham

>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>  ...re-PlatformQt.cmake-Fix-no-x11-build.patch | 46 +++++++++++++++++++
>>  .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
>>  2 files changed, 48 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-
>WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
>>
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-
>PlatformQt.cmake-Fix-no-x11-build.patch b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
>> new file mode 100644
>> index 00000000..c70b3dc0
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-
>PlatformQt.cmake-Fix-no-x11-build.patch
>> @@ -0,0 +1,46 @@
>> +From 82b7ec12b768ba9de4b7a4ae71500a3de6574bfd Mon Sep 17 00:00:00 2001
>> +From: Gowtham Tammana <g-tammana@ti.com>
>> +Date: Thu, 1 Apr 2021 10:45:13 -0500
>> +Subject: [PATCH] WebCore/PlatformQt.cmake: Fix no x11 build
>> +
>> +For platforms with no x11 support, egl package config sets up
>EGL_NO_X11
>> +flag. However the build is not picking up this flag at the moment
>> +causing below build failure.
>> +
>> +```{.package=3Dqtwebkit .version=3Ddunfell}
>> +In file included from
>> +tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-
>linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-
>sysroot/usr/include/EGL/egl.h:39,
>> +                from tisdk/build/arago-tmp-external-arm-
>glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-
>r0.arago7/git/Source/WebCore/platform/graphics/opengl/Extensions3DOpenGLES
>.cpp:36:
>> +tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-
>linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-
>sysroot/usr/include/EGL/eglplatform.h:134:10: fatal error: X11/Xlib.h: No
>such file or directory
>> +  134 | #include <X11/Xlib.h>
>> +      |          ^~~~~~~~~~~~
>> +compilation terminated.
>> +```
>> +
>> +Set this flag explicitly when there is no X11 target enable.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> +---
>> + Source/WebCore/PlatformQt.cmake | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +diff --git a/Source/WebCore/PlatformQt.cmake
>b/Source/WebCore/PlatformQt.cmake
>> +index 99c625dc3..375d28a47 100644
>> +--- a/Source/WebCore/PlatformQt.cmake
>> ++++ b/Source/WebCore/PlatformQt.cmake
>> +@@ -350,6 +350,10 @@ if (ENABLE_OPENGL)
>> +             ${Qt5Gui_EGL_LIBRARIES}
>> +             ${Qt5Gui_OPENGL_LIBRARIES}
>> +         )
>> ++        if (NOT ENABLE_X11_TARGET)
>> ++            # EGL definitions are not getting detected. Add the
>EGL_NO_X11 flag.
>> ++            add_definitions("-DEGL_NO_X11")
>> ++        endif ()
>> +     else ()
>> +         list(APPEND WebCore_SOURCES
>> +             platform/graphics/opengl/Extensions3DOpenGL.cpp
>> +--
>> +2.31.1
>> +
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
>b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
>> index 75213487..308f3f25 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
>> @@ -6,9 +6,10 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>
>>  SRC_URI +=3D " \
>>  	file://GraphicsSurfaceGL_NoX.cpp.patch \
>> +	file://0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch \
>>  "
>>
>> -PR_append =3D ".arago7"
>> +PR_append =3D ".arago8"
>>
>>  EXTRA_OECMAKE_append =3D " -DCMAKE_BUILD_TYPE=3DRelease"
>>
>> --
>> 2.31.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>
>
>--
>Regards,
>Denys Dmytriyenko <denis@denix.org>
>PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
>Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

