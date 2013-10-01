Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B5FA95296F
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:41:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DfvAq009206;
	Tue, 1 Oct 2013 08:41:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91Dfud5029689;
	Tue, 1 Oct 2013 08:41:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:41:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] run-opentest: handle kernel images in
	zImage in addition to uImage format
Thread-Index: AQHOvnWaYKf19IOoDESa1wl9AtLcfpnf2trw
Date: Tue, 1 Oct 2013 13:41:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159775E69@DLEE11.ent.ti.com>
References: <1380611545-23840-1-git-send-email-denis@denix.org>
In-Reply-To: <1380611545-23840-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] run-opentest: handle kernel images in zImage in addition to uImage format
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
X-List-Received-Date: Tue, 01 Oct 2013 13:41:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:12 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/3] run-opentest: handle kernel
>images in zImage in addition to uImage format
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> lib/run-opentest |    4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/lib/run-opentest b/lib/run-opentest
>index d3a04f3..7372e75 100644
>--- a/lib/run-opentest
>+++ b/lib/run-opentest
>@@ -170,9 +170,9 @@ run_target_side_test() {
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
>+        kernel=3D$test_dir/temp/board-support/prebuilt-
>images/[uz]Image-$m.bin

Does the opentest call resolve the [uz] or use it as a literal value?

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

