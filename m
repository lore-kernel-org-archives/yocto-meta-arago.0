Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 423F2529D4
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2013 14:04:06 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MML00JKV5PYA4C0@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 10 May 2013 09:03:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B7E48200A9; Fri,
	10 May 2013 10:03:34 -0400 (EDT)
Date: Fri, 10 May 2013 10:03:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20130510140334.GA9184@denix.org>
References: <1368182845-8507-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED10159554B95@DLEE11.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED10159554B95@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] Add recipe for test images
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
X-List-Received-Date: Fri, 10 May 2013 14:04:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 10, 2013 at 01:26:23PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Nelson, Sam
> >Sent: Friday, May 10, 2013 5:47 AM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH] Add recipe for test images
> >
> 
> You patch description is wrong and there is no reason given.  You are not adding a recipe but modifying an existing one.
> 
> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >---
> > .../recipes-core/images/arago-test-image.bb        |    2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/recipes-core/images/arago-test-
> >image.bb b/meta-arago-distro/recipes-core/images/arago-test-
> >image.bb
> >index f220127..ff4cd26 100644
> >--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
> >+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
> >@@ -3,7 +3,7 @@
> >
> > require arago-image.inc
> >
> >-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|keystone-evm"
> >+COMPATIBLE_MACHINE = "(?!arago)"
> 
> What is the reason driving this change?

Otherwise, we might just drop COMPATIBLE_MACHINE here completely.

-- 
Denys

