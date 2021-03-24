Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id E567252A22
	for <meta-arago@arago-project.org>;
	Wed, 24 Mar 2021 14:30:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12OEUOtg069858;
	Wed, 24 Mar 2021 09:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616596224;
	bh=6OJ5QzR+5TLr+/jkZjlSOnq69cULsLMy6KiG4c8c13I=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=hc2X5AW/uv1isCjPQlojoAVIKa/y/orjsTRvCbQBs17EMt9f8cj4HP2kFcQfXYMbn
	z6pL8jLxeBDOVYHZDSO+bVL1pi3hRufHsct6B+EHfHmvn4wteM1xygwbQpQDwzog3T
	Vn145wQp1mmqzjoof+DVmsjvI5rj3VaIqdR5wlok=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12OEUOjB129814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Mar 2021 09:30:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 24 Mar 2021 09:30:24 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Wed, 24 Mar 2021 09:30:24 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [dunfell/master][PATCH 4/4] qtwebengine:
	fix building latest qtwebengine with meta-python2
Thread-Index: AQHXICmm802eopiqdE+oQJWx4C96K6qTM8Sw
Date: Wed, 24 Mar 2021 14:30:24 +0000
Message-ID: <6fdbcfdcaf3c488b901199e9397815ed@ti.com>
References: <1616534107-46438-1-git-send-email-denis@denix.org>
	<1616534107-46438-4-git-send-email-denis@denix.org>
In-Reply-To: <1616534107-46438-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [dunfell/master][PATCH 4/4] qtwebengine: fix building latest qtwebengine with meta-python2
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
X-List-Received-Date: Wed, 24 Mar 2021 14:30:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
>project.org> On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, March 23, 2021 4:15 PM
>To: meta-arago@arago-project.org
>Cc: Denys Dmytriyenko <denys@konsulko.com>
>Subject: [EXTERNAL] [meta-arago] [dunfell/master][PATCH 4/4] qtwebengine:
>fix building latest qtwebengine with meta-python2
>
>From: Denys Dmytriyenko <denys@konsulko.com>
>
>When meta-python2 (dunfell) layer is present, qtwebengine can be built.
>
>Enable "examples" flag to package them into qtwebengine-examples package.
>
>Drop old inappropriate patch that no longer applies to Qt 5.14
>
>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>---
> meta-arago-distro/conf/distro/arago.conf           |  1 +
> ...-set-default-logging-level-back-to-LOG_FA.patch | 47 -----------------=
-
>----
> .../recipes-qt/qt5/qtwebengine_git.bbappend        |  1 -
> 3 files changed, 1 insertion(+), 48 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-
>qtwebengine-set-default-logging-level-back-to-LOG_FA.patch
>
>diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
>distro/conf/distro/arago.conf
>index 7c70281..206e65e 100644
>--- a/meta-arago-distro/conf/distro/arago.conf
>+++ b/meta-arago-distro/conf/distro/arago.conf
>@@ -132,6 +132,7 @@ PACKAGECONFIG_append_pn-qtscript =3D " examples"
> PACKAGECONFIG_append_pn-qtserialport =3D " examples"
> PACKAGECONFIG_append_pn-qtsvg =3D " examples"
> PACKAGECONFIG_append_pn-qtwayland =3D " examples"
>+PACKAGECONFIG_append_pn-qtwebengine =3D " examples"
>
> # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
> PACKAGECONFIG_pn-curl =3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6"=
,
>"ipv6", "", d)} ssl zlib"
>diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine=
-
>set-default-logging-level-back-to-LOG_FA.patch b/meta-arago-distro/recipes=
-
>qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-
>LOG_FA.patch
>deleted file mode 100644
>index 1486d17..0000000
>--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-
>default-logging-level-back-to-LOG_FA.patch
>+++ /dev/null
>@@ -1,47 +0,0 @@
>-From 7e2a1b06447693c588a0608cef22636bc6edb466 Mon Sep 17 00:00:00 2001
>-From: Eric Ruei <e-ruei1@ti.com>
>-Date: Thu, 25 May 2017 16:55:38 -0400
>-Subject: [PATCH 2/3] qtwebengine: set default logging level back to
>LOG_FATAL
>-
>-Suppress info, warning and error messages by default to be consistent
>-with QT5.6.2 behavior
>-
>-Upstream-Status: Inappropriate
>-It is clear that this workaround reverses the course of QT, but we do nee=
d
>-this change as described above.
>-
>-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>----
>- src/core/content_main_delegate_qt.cpp | 9 ++++++++-
>- 1 file changed, 8 insertions(+), 1 deletion(-)
>-
>-diff --git a/src/core/content_main_delegate_qt.cpp
>b/src/core/content_main_delegate_qt.cpp
>-index 8bd07ef..6d8cfb1 100644
>---- a/src/core/content_main_delegate_qt.cpp
>-+++ b/src/core/content_main_delegate_qt.cpp
>-@@ -111,14 +111,21 @@ void ContentMainDelegateQt::PreSandboxStartup()
>-     settings.logging_dest =3D DetermineLogMode(*parsedCommandLine);
>-     logging::InitLogging(settings);
>-
>-+    // Suppress info, warning and error messages per default.
>-+    int logLevel =3D logging::LOG_FATAL;
>-+
>-     if (logging::GetMinLogLevel() >=3D logging::LOG_INFO) {
>-         if (parsedCommandLine->HasSwitch(switches::kLoggingLevel)) {
>-             std::string logLevelValue =3D parsedCommandLine-
>>GetSwitchValueASCII(switches::kLoggingLevel);
>-             int level =3D 0;
>-             if (base::StringToInt(logLevelValue, &level) && level >=3D
>logging::LOG_INFO && level < logging::LOG_NUM_SEVERITIES)
>--                logging::SetMinLogLevel(level);
>-+                logLevel =3D level;
>-+                //logging::SetMinLogLevel(level);
>-         }
>-     }
>-+
>-+    logging::SetMinLogLevel(logLevel);
>-+
>- }
>-
>- content::ContentBrowserClient
>*ContentMainDelegateQt::CreateContentBrowserClient()
>---
>-1.9.1
>-
>diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
>b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
>index 28ff601..c50b020 100644
>--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
>+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
>@@ -2,7 +2,6 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> PR_append =3D ".arago1"
>
> SRC_URI +=3D " \
>-    file://0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patc=
h
>\
>     file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patc=
h
>\
> "
>
>--
>2.7.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

