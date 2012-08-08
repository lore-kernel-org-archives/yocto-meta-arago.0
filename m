Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTP id C4F0C52A58
	for <meta-arago@arago-project.org>;
	Wed,  8 Aug 2012 02:14:35 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8E00GN1ZJG9EA0@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Aug 2012 21:14:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AED16201B7; Tue,
	07 Aug 2012 22:14:04 -0400 (EDT)
Date: Tue, 07 Aug 2012 22:14:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120808021404.GA32275@denix.org>
References: <8F29D6B095ED194EA1980491A5E029710C27EAD2@DFLE30.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C27EAD2@DFLE30.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHES] Porting sysvinit changes from arago to meta-arago
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
X-List-Received-Date: Wed, 08 Aug 2012 02:14:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Franklin,

As previously mentioned, we should not blindly port all the old fixes and 
workarounds from Arago to meta-arago. Specifically, in these 2 patches you are 
bringing in setting default gettys for the fake "arago" machine, which you 
don't need or have (although, I'll be porting that soon) as well as disabling 
hwclock due to some old issue we used to have. I'd recommend checking the 
history of such changes before deciding if we still need those in meta-arago:

$ git log recipes/sysvinit/sysvinit/rcS-default

commit 393de1d0a68bd371328c3765b5df0fc32bb3f0be
Author: Denys Dmytriyenko <denis@denix.org>
Date:   Wed Jun 17 21:35:04 2009 -0400

    rcS-default: disable hwclock use due to missing RTC (temporary?)

Do we still have this issue with our current platforms? Is it applicable to 
all out supported platforms?

Denys

