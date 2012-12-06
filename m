Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id D549F52AB2
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2012 20:34:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MEM00CKAMGKDC12@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 06 Dec 2012 14:34:07 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B111E20101; Thu,
	06 Dec 2012 15:33:56 -0500 (EST)
Date: Thu, 06 Dec 2012 15:33:56 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-id: <20121206203356.GD17596@denix.org>
References: <50BFA673.6040800@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C342343@DFLE09.ent.ti.com>
	<50C0FFE3.2090304@ti.com>
MIME-version: 1.0
In-reply-to: <50C0FFE3.2090304@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] Define arago-test-image
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
X-List-Received-Date: Thu, 06 Dec 2012 20:34:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Dec 06, 2012 at 03:28:19PM -0500, Carlos Hernandez wrote:
> Franklin,
> 
> That's a fair point. I did it to keep some independence between the
> arago-test and arago-tisdk images but I'm OK including
> task-arago-tisdk-addons instead of task-arago-test-addons. I guess we
> could separate into different task files only if needed in the future.
> 
> One task that will need to be added to task-arago-tisdk-addons is
> bridge-utils.
> bridge-utils is currently only included by task-arago-test-addons.
> 
> Let me know if you are OK adding bridge-utils and I can submit another
> patch with these changes.

You could also add bridge-utils to your task-arago-test recipe.

Or, you could just add bridge-utils besides the regular task-arago-tisdk-addons 
to IMAGE_INSTALL in your test image recipe:

IMAGE_INSTALL += "\
    task-arago-base \
    task-arago-console \
    task-arago-base-tisdk \
    task-arago-tisdk-connectivity \
    task-arago-tisdk-crypto \
    task-arago-tisdk-multimedia \
    task-arago-tisdk-addons \
    task-arago-test \
    bridge-utils \
    "

Denys

> Thanks for the review,
> Carlos
> 
> On 12/06/2012 02:30 PM, Cooper Jr., Franklin wrote:
> > Can't task-arago-tisdk-addons be used instead of creating this new task-arago-test-addons recipe? The majority of the content in arago-test-addons is provided by task-arago-addons and the remainder is provided by tasks your pulling into the test image recipe. Other than having a slightly bloated file system with additional tools/libraries is there any reason you can't reuse some of the other tasks?
> >
> >> -----Original Message-----
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> bounces@arago-project.org] On Behalf Of Hernandez, Carlos
> >> Sent: Wednesday, December 05, 2012 1:54 PM
> >> To: meta-arago@arago-project.org
> >> Subject: [meta-arago] [PATCH] Define arago-test-image
> >>
> >> This filesystem image includes test appplications used by Linux validation team.
> >>
> >> Please consider it for meta-arago project. Thanks, Carlos
> >>
> >>
> >>
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

