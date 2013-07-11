Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id 8C53352990
	for <meta-arago@arago-project.org>;
	Thu, 11 Jul 2013 02:58:03 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MPR00AWZ47Y3G50@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 10 Jul 2013 21:57:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EEF82201AC; Wed,
	10 Jul 2013 22:57:32 -0400 (EDT)
Date: Wed, 10 Jul 2013 22:57:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-id: <20130711025732.GA26533@denix.org>
References: <8EAE6244CE843044A42356038645C8551573366C@DFLE12.ent.ti.com>
	<8EAE6244CE843044A42356038645C85515733685@DFLE12.ent.ti.com>
	<20130710163214.GA16407@edge> <51DE1710.1090305@ti.com>
MIME-version: 1.0
In-reply-to: <51DE1710.1090305@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: Compiling gcc for A15 in Yocto
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
X-List-Received-Date: Thu, 11 Jul 2013 02:58:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jul 11, 2013 at 07:53:12AM +0530, Siddharth Heroor wrote:
> On 7/10/2013 10:02 PM, Denys Dmytriyenko wrote:
> > On Wed, Jul 10, 2013 at 03:52:47PM +0000, Saran, Sajesh Kumar wrote:
> >> I am not clear in last e-mail.
> >>
> >> We are trying to compile gcc for ARM in an X86 Ubuntu machine.
> > 
> > Sajesh,
> > 
> > If you use recent recipes in Yocto to build gcc from sources, it doesn't use 
> > any git or svn repositories any more, but downloads a release tarball. I've 
> > done it before and there's an easy way to enable it in Arago - just set 
> > TOOLCHAIN_TYPE=internal
> > 
> 
> Slightly related question. Is it possible to get tools-sdk as a
> IMAGE_FEATURE? I haven't been able to do that successfully. We use the
> Linaro 4.7 as an external toolchain, but having tools-sdk with
> gcc-linaro-4.7 as the compiler running on the target is very useful.

Linaro toolchain is a cross-compiler and we use pre-built binaries that are to 
be run on x86 to generate code for ARM. It won't be possible to run it on the 
target (ARM). You'd need to compile the toolchain from sources for ARM. That 
is what Sajesh and Djordje were asking for - to be able to build gcc for the 
target from sources...

-- 
Denys

