Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DD252529B0
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 14:58:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OEw3gh030179;
	Tue, 24 Sep 2013 09:58:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OEw3pn010274;
	Tue, 24 Sep 2013 09:58:03 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 09:58:03 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] tisdk-image.bbclass: adjust to handle
	zImage along with uImage kernels
Thread-Index: AQHOuOlwo0kY34PkNUWOO0C4Ez141pnU+vmQ
Date: Tue, 24 Sep 2013 14:58:03 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159747D26@DLEE11.ent.ti.com>
References: <1380001570-25248-1-git-send-email-denis@denix.org>
	<1380001570-25248-2-git-send-email-denis@denix.org>
In-Reply-To: <1380001570-25248-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] tisdk-image.bbclass: adjust to handle zImage along with uImage kernels
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
X-List-Received-Date: Tue, 24 Sep 2013 14:58:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, September 24, 2013 12:46 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 2/2] tisdk-image.bbclass: adjust to
>handle zImage along with uImage kernels
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/classes/tisdk-image.bbclass | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-
>arago-distro/classes/tisdk-image.bbclass
>index 4397a70..c365eaa 100644
>--- a/meta-arago-distro/classes/tisdk-image.bbclass
>+++ b/meta-arago-distro/classes/tisdk-image.bbclass
>@@ -523,9 +523,9 @@ do_sdk_image () {
>     fi
>
>     # Copy the Kernel image if it exists
>-    if [ -e ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin ]
>+    if [ -e ${DEPLOY_DIR_IMAGE}/[uz]Image-${MACHINE}.bin ]
>     then
>-        cp ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.bin
>${prebuilt_dir}/
>+        cp ${DEPLOY_DIR_IMAGE}/[uz]Image-${MACHINE}.bin
>${prebuilt_dir}/
>     else
>         echo "Could not find the Kernel image"
>         return 1
>@@ -539,7 +539,7 @@ do_sdk_image () {
>     then
>         for f in `find ${DEPLOY_DIR_IMAGE} -type l -name
>"*${DTB_FILTER}*.dtb"`
>         do
>-            dtb_file=3D`basename $f | sed s/uImage-//`
>+            dtb_file=3D`basename $f | sed s/.Image-//`
>             cp $f ${prebuilt_dir}/${dtb_file}
>         done
>     fi
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

