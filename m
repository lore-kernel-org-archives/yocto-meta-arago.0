Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5272A52976
	for <meta-arago@arago-project.org>;
	Fri,  4 Dec 2015 20:09:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4K9Ak9022559
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 14:09:10 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4K9AX8028116
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 14:09:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 14:09:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4K99RL027347;
	Fri, 4 Dec 2015 14:09:10 -0600
Date: Fri, 4 Dec 2015 15:08:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151204200854.GY6264@edge>
References: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
	<1449241270-6294-5-git-send-email-j-stiffler@ti.com>
	<5661C551.2030203@ti.com>
MIME-Version: 1.0
In-Reply-To: <5661C551.2030203@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts][PATCH 4/5] setup-tftp: Copy pmmc-firmware if available
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
X-List-Received-Date: Fri, 04 Dec 2015 20:09:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Dec 04, 2015 at 11:54:41AM -0500, Jacob Stiffler wrote:
> Due to recent updates in u-boot, this patch will need to be reworked
> as the pmmc firmware name has been changed.

Ack


> On 12/4/2015 10:01 AM, Jacob Stiffler wrote:
> >Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >---
> >  setup-tftp.sh | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> >diff --git a/setup-tftp.sh b/setup-tftp.sh
> >index 714968f..d675ba4 100644
> >--- a/setup-tftp.sh
> >+++ b/setup-tftp.sh
> >@@ -159,6 +159,9 @@ copy_to_tftproot "$uboot_gph_files"
> >  monfiles=`cd $prebuiltimagesdir;ls -1 skern*.bin 2> /dev/null`
> >  copy_to_tftproot "$monfiles"
> >+pmmcfiles=`cd $prebuiltimagesdir;ls -1 pmmc*.bin 2> /dev/null`
> >+copy_to_tftproot "$pmmcfiles"
> >+
> >  echo
> >  if [ -f $tftpcfg ]; then
> >      echo "$tftpcfg already exists.."
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

