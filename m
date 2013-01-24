Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTP id B243152A21
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 18:16:04 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH500ASO6PZPBI0@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 24 Jan 2013 12:15:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 31EBC201C0; Thu,
	24 Jan 2013 13:15:34 -0500 (EST)
Date: Thu, 24 Jan 2013 13:15:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Kovitz <paul.kovitz@welchallyn.com>
Message-id: <20130124181534.GA23977@denix.org>
References: <CA+edY+Svcn3OkAAO+U_cz8+NZBA9TxbR3f532G2nPNYQHXMm1A@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+edY+Svcn3OkAAO+U_cz8+NZBA9TxbR3f532G2nPNYQHXMm1A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: newbie question: what is the best way to make sure bitbake uses bash instead of dash?
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
X-List-Received-Date: Thu, 24 Jan 2013 18:16:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 24, 2013 at 10:08:14AM -0800, Paul Kovitz wrote:
> The do_install step will fail to install the toolchain libraries unless you
> have bash as the default shell. Making the default system shell bash hurts
> boot time according to some data I have seen. Right now I used sudo
> dpkg-reconfigure dash to make the default bash. Is there a better way?

That's the correct way.

> If there is no better way, should the oe-layersetup.sh script do it for you 
> if $SHELL is not /bin/bash?

oe-layersetup.sh is distro-agnostic and should stay that way. Switching off 
dash is strictly Ubuntu-specific and requires root privileges, not something 
we'd want in oe-layersetup.sh...

There's a recent effort to get rid of bashisms in OE-Core and our layers 
(actually, if you chekc logs, you'll see some changes already). But for 
meta-arago to get full benefits of that, it needs to be upgraded from denzil 
to danny, which should happen soon.

-- 
Denys

