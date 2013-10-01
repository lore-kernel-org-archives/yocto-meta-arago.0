Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7FDDF5297F
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 14:49:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91EnU86017879
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 09:49:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91EnUvc031388
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 09:49:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 09:49:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91EnUrw017048;
	Tue, 1 Oct 2013 09:49:30 -0500
Date: Tue, 1 Oct 2013 10:49:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131001144929.GM26572@edge>
References: <1380611545-23840-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED10159775E69@DLEE11.ent.ti.com>
	<20131001143713.GL26572@edge>
MIME-Version: 1.0
In-Reply-To: <20131001143713.GL26572@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Tue, 01 Oct 2013 14:49:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 01, 2013 at 10:37:13AM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 01, 2013 at 01:41:56PM +0000, Maupin, Chase wrote:
> > 
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > >Sent: Tuesday, October 01, 2013 2:12 AM
> > >To: meta-arago@arago-project.org
> > >Subject: [meta-arago] [PATCH 1/3] run-opentest: handle kernel
> > >images in zImage in addition to uImage format
> > >
> > >From: Denys Dmytriyenko <denys@ti.com>
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >---
> > > lib/run-opentest |    4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/lib/run-opentest b/lib/run-opentest
> > >index d3a04f3..7372e75 100644
> > >--- a/lib/run-opentest
> > >+++ b/lib/run-opentest
> > >@@ -170,9 +170,9 @@ run_target_side_test() {
> > >         return 1
> > >     fi
> > >
> > >-    if [ -f $test_dir/temp/board-support/prebuilt-images/uImage-
> > >$m.bin ]
> > >+    if [ -f $test_dir/temp/board-support/prebuilt-
> > >images/[uz]Image-$m.bin ]
> > >     then
> > >-        kernel=$test_dir/temp/board-support/prebuilt-
> > >images/uImage-$m.bin
> > >+        kernel=$test_dir/temp/board-support/prebuilt-
> > >images/[uz]Image-$m.bin
> > 
> > Does the opentest call resolve the [uz] or use it as a literal value?
> 
> Yes, I believe it gets resolved before it reaches opentest app.

Or maybe not! :) Looks like I got fooled by pre-loaded images on SD card...


> > >         if [ "$odtb" ]
> > >         then
> > >             dtb="~dtb=$test_dir/temp/board-support/prebuilt-
> > >images/$odtb"
> > >--
> > >1.7.9.5
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

