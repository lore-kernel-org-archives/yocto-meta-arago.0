Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9F1E5529AE
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2018 16:01:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBAG10eu035352
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 10:01:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544457660;
	bh=aAroyBDkG8WoaQX9q95QVNOL8ew9vOep5yVAu3XYNp0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=vm5/ECj2RtUq1xrfzFp++4BpmQW2GBUuCrVM2ku7MUcf4iG0Jp9OUgV3VH0rfPXH3
	2khinLqncTJ6r4T8IS6A2JFnij3N7BftGCJ43ZKmafkaa/9+35AUNLgs9u7cT/4NAy
	nRRwe+dKV0aB6c4wBCcUknZC9CNCjLLo3NQJj4QQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBAG10jV073866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 10:01:00 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 10 Dec 2018 10:00:59 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1591.008; Mon, 10 Dec 2018 10:00:59 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH]
	arm_multimedia: use higher resolution video image for AM654x EVM
Thread-Index: AQHUkKByoMnFacWk6Ei7QvH7IPHIyKV4IZnQ
Date: Mon, 10 Dec 2018 16:00:59 +0000
Message-ID: <aaadc5bada5a466980c2a9953bea166b@ti.com>
References: <1544457178-42856-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1544457178-42856-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] arm_multimedia: use higher resolution video image for AM654x EVM
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
X-List-Received-Date: Mon, 10 Dec 2018 16:01:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK

It was sent by mistake.  It is not for meta-processor-sdk.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Ruei, Eric
Sent: Monday, December 10, 2018 10:53 AM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] arm_multimedia=
: use higher resolution video image for AM654x EVM

AM654x EVM: play 1280x540 video image on 1280x800 LCD

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../arm_multimedia_h264dec/runH264Dec.sh           |  5 ++-
 .../arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh   | 37 ++++++++++++------=
----
 .../arm_multimedia_mpeg4dec/runMpeg4Dec.sh         |  5 ++-
 3 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh b/multime=
dia_apps/arm_multimedia_h264dec/runH264Dec.sh
index be8b2dc..f1ea7dd 100644
--- a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
+++ b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
@@ -15,7 +15,7 @@ then
 elif [ "$machine_type" =3D "omap5-evm" ]
 then
     filename=3D"/usr/share/ti/video/TearOfSteel-Short-720x406.264"
-elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D "am437x=
-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ] || [ "$machine_type=
" =3D "am65xx-evm" ]
+elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D "am437x=
-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]
 then
         resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
         if [ "$resolution" =3D "480x272" ]; then
@@ -23,6 +23,9 @@ then
         else
                 filename=3D"/usr/share/ti/video/TearOfSteel-Short-720x406.=
264"
         fi
+elif [ "$machine_type" =3D "am65xx-evm" ]
+then
+     filename=3D"/usr/share/ti/video/TearOfSteel-Short-1280x540.h264"
 else
 	default_display=3D"`cat /sys/devices/platform/omapdss/manager0/display`"
 	if [ "$default_display" =3D "dvi" ]; then
diff --git a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh b=
/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
index 18ee0ea..93e6eae 100644
--- a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
@@ -15,21 +15,24 @@ else
 		else
 			# Use WVGA for all other resolutions
 			filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-720x420.mp4"
-	fi
-    elif [ "$machine_type" =3D "dra7xx-evm" ]
-    then
-	    filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-720x420.mp4"
-    elif [ "$machine_type" =3D "omap5-evm" ]
-    then
-        filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
-    elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D "am=
437x-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]|| [ "$machine_t=
ype" =3D "am65xx-evm" ]
-    then
-            resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
-            if [ "$resolution" =3D "480x272" ]; then
-                filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-400x2=
40.mp4"
-            else
-                filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-720x4=
06.mp4"
-            fi
+		fi
+	elif [ "$machine_type" =3D "dra7xx-evm" ]
+	then
+		filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-720x420.mp4"
+	elif [ "$machine_type" =3D "omap5-evm" ]
+	then
+		filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
+	elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D "am437=
x-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]
+	then
+		resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
+		if [ "$resolution" =3D "480x272" ]; then
+			filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-400x240.mp4"
+		else
+			filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4"
+		fi
+	elif [ "$machine_type" =3D "am65xx-evm" ]
+	then
+		filename=3D"/usr/share/ti/video/TearOfSteel-Short-1280x540.m4v"
 	else
 		default_display=3D"`cat /sys/devices/platform/omapdss/manager0/display`"
 		if [ "$default_display" =3D "dvi" ]; then
@@ -52,9 +55,9 @@ else
 		amixer -c 0 set Headset 1+ unmute
 	elif [ "$machine_type" =3D "am335x-evm" ] || [ "$machine_type" =3D "am335=
x-hs-evm" ]; then
 		amixer cset name=3D'PCM Playback Volume' 127
-    elif [ "$machine_type" =3D "omap5-evm" ]; then
+	elif [ "$machine_type" =3D "omap5-evm" ]; then
 		amixer cset name=3D'PCM Playback Volume' 127
-    elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D "am=
437x-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]; then
+	elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D "am437=
x-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]; then
=20
 		# EPOS uses a different configuration so check if
 		# we are running on that board
diff --git a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh b/multi=
media_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
index 410d8ea..82fcb2c 100644
--- a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
+++ b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
@@ -15,7 +15,7 @@ then
 elif [ "$machine_type" =3D "omap5-evm" ]
 then
     filename=3D"/usr/share/ti/video/TearOfSteel-Short-720x406.m4v"
-elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D "am437x=
-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ] || [ "$machine_type=
" =3D "am65xx-evm" ]
+elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D "am437x=
-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]
 then
     resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
     if [ "$resolution" =3D "480x272" ]; then
@@ -23,6 +23,9 @@ then
     else
             filename=3D"/usr/share/ti/video/TearOfSteel-Short-720x406.m4v"
     fi
+elif [ "$machine_type" =3D "am65xx-evm" ]
+then
+     filename=3D"/usr/share/ti/video/TearOfSteel-Short-1280x540.m4v"
 else
 	default_display=3D"`cat /sys/devices/platform/omapdss/manager0/display`"
 	if [ "$default_display" =3D "dvi" ]; then
--=20
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

