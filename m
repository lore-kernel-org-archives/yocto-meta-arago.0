Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1D3AE52090
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2018 16:45:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGj8Im109673
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 11:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538153108;
	bh=kIo7RcO4jL6DVFwhqQ5ll4AlYGYxqUU46OIXR77oUs4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=JD0LcLlsj3lenUZzUeex+4r4wLk62Ep7GoXwgSPwITdWxWb14S0AzHi+sBbUjDBsT
	BbnL+N/6AamCdFD5S8DM4bxZ+zWFPt3G9e3twXcFfXltoF+7uvQq5swDsitIqKiwNG
	XM4AYyizO47orCWAYF12Ub0C9eyQwV9g/c7yCUbQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGj8M1029739
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 11:45:08 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:45:08 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1466.003; Fri, 28 Sep 2018 11:45:08 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [matrix-gui-v2-apps] [PATCH] tidl_demo*: remove
	timeout to exit a demo
Thread-Index: AQHUV0bwUXA+kSgKi0qgHq4ncEi6Z6UF5LNAgAAB3fA=
Date: Fri, 28 Sep 2018 16:45:08 +0000
Message-ID: <760845303a1b408fb7db89c1acf20662@ti.com>
References: <1538151527-28218-1-git-send-email-a0271529@ti.com>
	<cb702888408b41928bc011f2f8a9fc19@ti.com>
In-Reply-To: <cb702888408b41928bc011f2f8a9fc19@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.103.75]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: [matrix-gui-v2-apps] [PATCH] tidl_demo*: remove timeout to exit a demo
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
X-List-Received-Date: Fri, 28 Sep 2018 16:45:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

-----Original Message-----
From: Gou, Hongmei=20
Sent: Friday, September 28, 2018 12:19 PM
To: meta-arago@arago-project.org
Cc: Gou, Hongmei
Subject: [meta-arago] [matrix-gui-v2-apps] [PATCH] tidl_demo*: remove timeo=
ut to exit a demo

* tidl_classification has already mechanism to exit a demo
  (by right-clicking the main window)

* Avoid the side problem of not returning to the demo HTML page
  in time after right-clicking the main window before the timeout

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh                     | 4 +---
 tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh             | 4 +---
 tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh               | 5 +---=
-
 tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh                 | 3 +--
 tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh | 3 +--
 tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh         | 4 +---
 6 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh b/tidl_apps/tidl=
_demo_livecam/runTidlLiveCam.sh
index 6b80d0e..e225519 100644
--- a/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
+++ b/tidl_apps/tidl_demo_livecam/runTidlLiveCam.sh
@@ -1,5 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
=20
-./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt =
-i 1 -c ./stream_config_j11_v2.txt & pid=3D$!
-
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt =
-i 1 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh b/tidl_a=
pps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
index 9219f60..9dfd098 100644
--- a/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
+++ b/tidl_apps/tidl_demo_livecam_lg2/runTidlLiveCam_lg2.sh
@@ -1,5 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
=20
-./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt =
-i 1 -c ./stream_config_j11_v2.txt & pid=3D$!
-
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt =
-i 1 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh b/tidl_app=
s/tidl_demo_pnexamples/runTidlPnExamples.sh
index 37e5ec3..7171f53 100644
--- a/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
+++ b/tidl_apps/tidl_demo_pnexamples/runTidlPnExamples.sh
@@ -1,6 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
=20
-./tidl_classification -g 2 -d 1 -e 1 -l ./imagenet.txt -s ./classlist.txt =
-i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt & pid=3D$!
-
-{ sleep 3600; kill $pid; }
-
+./tidl_classification -g 2 -d 1 -e 1 -l ./imagenet.txt -s ./classlist.txt =
-i ./clips/test2.mp4 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh b/tidl_apps/=
tidl_demo_staticimg/runTidlStaticImg.sh
index 8d9d5d4..7d017d4 100644
--- a/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
+++ b/tidl_apps/tidl_demo_staticimg/runTidlStaticImg.sh
@@ -1,4 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
=20
-./tidl_classification -g 1 -d 2 -e 2 -l ./imagenet.txt -s ./classlist.txt =
-i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=3D$!
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 1 -d 2 -e 2 -l ./imagenet.txt -s ./classlist.txt =
-i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly=
.sh b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
index b32fe56..64e3c68 100644
--- a/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
+++ b/tidl_apps/tidl_demo_staticimg_dsponly/runTidlStaticImg_dsponly.sh
@@ -1,4 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
=20
-./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt =
-i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=3D$!
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 1 -d 2 -e 0 -l ./imagenet.txt -s ./classlist.txt =
-i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
diff --git a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh b/ti=
dl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
index 83fdab9..4824722 100755
--- a/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
+++ b/tidl_apps/tidl_demo_staticimg_lg2/runTidlStaticImg_lg2.sh
@@ -1,5 +1,3 @@
 cd /usr/share/ti/tidl/examples/classification
=20
-./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt =
-i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt & pid=3D$!
-
-{ sleep 3600; kill $pid; }
+./tidl_classification -g 2 -d 1 -e 2 -l ./imagenet.txt -s ./classlist.txt =
-i ./clips/test10.mp4 -c ./stream_config_j11_v2.txt
--=20
1.9.1


