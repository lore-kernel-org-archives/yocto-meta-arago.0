Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 07C4252099
	for <meta-arago@arago-project.org>;
	Fri,  4 Oct 2013 20:41:42 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MU500H43W4S2XG1@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 04 Oct 2013 15:41:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0DCEE200A9; Fri,
	04 Oct 2013 16:41:15 -0400 (EDT)
Date: Fri, 04 Oct 2013 16:41:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20131004204115.GC8393@denix.org>
References: <1380650659-16536-1-git-send-email-fcooper@ti.com>
	<1380650659-16536-3-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015977A82E@DLEE11.ent.ti.com>
	<20131002140018.GF31698@edge>
MIME-version: 1.0
In-reply-to: <20131002140018.GF31698@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/3] Don't package kernel files in boot partition for AMSDK 7.0
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
X-List-Received-Date: Fri, 04 Oct 2013 20:41:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 02, 2013 at 10:00:18AM -0400, Denys Dmytriyenko wrote:
> On Wed, Oct 02, 2013 at 01:11:42PM +0000, Maupin, Chase wrote:
> > Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> Ack. This is amsdk specific config though.

So, this does apply to newer kernel and u-boot. Does it mean AMSDK 7.0 will 
only have platforms with 3.12 kernel and 2013.10 u-boot? :)

-- 
Denys


> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > >Sent: Tuesday, October 01, 2013 1:04 PM
> > >To: meta-arago@arago-project.org
> > >Cc: Cooper Jr., Franklin
> > >Subject: [meta-arago] [PATCH 3/3] Don't package kernel files in
> > >boot partition for AMSDK 7.0
> > >
> > >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > >---
> > > configs/amsdk-config-07.00.00.00.txt |    2 +-
> > > 1 files changed, 1 insertions(+), 1 deletions(-)
> > >
> > >diff --git a/configs/amsdk-config-07.00.00.00.txt b/configs/amsdk-
> > >config-07.00.00.00.txt
> > >index a011f83..bf409d7 100644
> > >--- a/configs/amsdk-config-07.00.00.00.txt
> > >+++ b/configs/amsdk-config-07.00.00.00.txt
> > >@@ -241,7 +241,7 @@ SD_CARD_CONTENT="/home/jenkins/extra-
> > >files/sd_content"
> > > # the boot partition tarball or not.  For newer kernel and u-boot
> > >combinations
> > > # the uImage and dtb files are kept in the rootfs partition and
> > >placing it in
> > > # the boot partition will cause confusion.
> > >-PACKAGE_BOOT_KERNEL_FILES="true"
> > >+PACKAGE_BOOT_KERNEL_FILES="false"
> > >
> > > # This variable points to the directory where the webgen tool has
> > >been
> > > # Installed.
> > >--
> > >1.7.0.4
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
> 

