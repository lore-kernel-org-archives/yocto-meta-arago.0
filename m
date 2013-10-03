Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 63E04529CC
	for <meta-arago@arago-project.org>;
	Thu,  3 Oct 2013 12:03:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r93C3Dl1001044;
	Thu, 3 Oct 2013 07:03:13 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r93C3C60032497;
	Thu, 3 Oct 2013 07:03:13 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 3 Oct 2013 07:03:12 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 1/3] run-opentest: handle kernel images
	in zImage in addition to uImage format
Thread-Index: AQHOv7UzyyY0D1QW2E+qw+5oriSLqpni4YeQ
Date: Thu, 3 Oct 2013 12:03:12 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977F52C@DLEE11.ent.ti.com>
References: <1380748769-17507-1-git-send-email-denis@denix.org>
In-Reply-To: <1380748769-17507-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/3] run-opentest: handle kernel images in zImage in addition to uImage format
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
X-List-Received-Date: Thu, 03 Oct 2013 12:03:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>



>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, October 02, 2013 4:19 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 1/3] run-opentest: handle kernel
>images in zImage in addition to uImage format
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
>v2 - fix passing not expanded [uz]Image to opentest
>
> lib/run-opentest |   11 +++++++++--
> 1 file changed, 9 insertions(+), 2 deletions(-)
>
>diff --git a/lib/run-opentest b/lib/run-opentest
>index d3a04f3..71f9b96 100644
>--- a/lib/run-opentest
>+++ b/lib/run-opentest
>@@ -170,9 +170,16 @@ run_target_side_test() {
>         return 1
>     fi
>
>-    if [ -f $test_dir/temp/board-support/prebuilt-images/uImage-
>$m.bin ]
>+    if [ -f $test_dir/temp/board-support/prebuilt-
>images/[uz]Image-$m.bin ]
>     then
>-        kernel=3D$test_dir/temp/board-support/prebuilt-
>images/uImage-$m.bin
>+        if [ -f $test_dir/temp/board-support/prebuilt-
>images/zImage-$m.bin ]
>+        then
>+            kernel=3D$test_dir/temp/board-support/prebuilt-
>images/zImage-$m.bin
>+        elif [ -f $test_dir/temp/board-support/prebuilt-
>images/uImage-$m.bin ]
>+        then
>+            kernel=3D$test_dir/temp/board-support/prebuilt-
>images/uImage-$m.bin
>+        fi
>+
>         if [ "$odtb" ]
>         then
>             dtb=3D"~dtb=3D$test_dir/temp/board-support/prebuilt-
>images/$odtb"
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

