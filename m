Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id D576F52A3E
	for <meta-arago@arago-project.org>;
	Wed,  1 May 2013 04:07:51 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MM30002PQ4ER7X4@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 30 Apr 2013 23:07:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EED34200A9; Wed,
	01 May 2013 00:07:25 -0400 (EDT)
Date: Wed, 01 May 2013 00:07:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-id: <20130501040725.GA5688@denix.org>
References: <20130422210740.GB28316@denix.org>
MIME-version: 1.0
In-reply-to: <20130422210740.GB28316@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Merging Linaro gcc-4.7 hardfp support
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
X-List-Received-Date: Wed, 01 May 2013 04:07:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 22, 2013 at 05:07:40PM -0400, Denys Dmytriyenko wrote:
> All,
> 
> As I have received mostly positive feedback from our teams (LCPD, AMSDK, 
> MCSDK) about early testing of the Linaro gcc-4.7 hardfp toolchain integartion, 
> I will be merging it into the master branch shortly. Please let me know if you 
> have any questions or concerns. Thanks.

All,

There's been slight delay in merging the Linaro-hardfp integration into the 
master branch due to few concerns raised by the kernel team last week. All 
has been resolved so far and I'll do the merge shortly, but since this may 
affect others, here are the details:


1. Compiling the same kernel tree with old gcc-4.5 and the new gcc-4.7 shows 
_less_ warnings. Some of the "variable may be used uninitialized" warnings are 
no longer reported, since gcc-4.7 is now able to remove more false positives:
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings


2. Building ARM kernel results in the following unusual warnings:

arch/arm/boot/compressed/head.S: Assembler messages:
arch/arm/boot/compressed/head.S:565: Warning: (null)
arch/arm/boot/compressed/head.S:676: Warning: (null)
arch/arm/boot/compressed/head.S:698: Warning: (null)

That is due to the changes made in recent binutils, related to ARMv8, and 
there is a patch with more details available (still pending for 3.10):
https://patchwork.kernel.org/patch/2013211/


3. Again, comparing to the previous builds under old toolchain, there are some 
"section mismatch" warnings missing, when built with the new toolchain, e.g.:

WARNING: vmlinux.o(.text+0x22ea4): Section mismatch in reference from the
function omapdrm_init() to the function .init.text:omap_device_build()
The function omapdrm_init() references
the function __init omap_device_build().
This is often because omapdrm_init lacks a __init
annotation or the annotation of omap_device_build is wrong.

After some investigation, a kernel patch was submitted by Tom Rini:
https://patchwork.kernel.org/patch/2486601/


Now, with all of the above concerns resolved I'll proceed with merging the 
linaro-hardfp branch into the master. Please let me know if you have any 
questions. Thanks.

-- 
Denys

