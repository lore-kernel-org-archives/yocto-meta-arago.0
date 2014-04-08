Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 600485299C
	for <meta-arago@arago-project.org>;
	Tue,  8 Apr 2014 01:04:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3814oSd004046
	for <meta-arago@arago-project.org>; Mon, 7 Apr 2014 20:04:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3814oE6028692
	for <meta-arago@arago-project.org>; Mon, 7 Apr 2014 20:04:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 7 Apr 2014 20:04:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3814o9l032114	for
	<meta-arago@arago-project.org>; Mon, 7 Apr 2014 20:04:50 -0500
Date: Mon, 7 Apr 2014 21:04:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Message-ID: <20140408010449.GE12929@edge>
References: <20140310121416.GC4423@ad.chargestorm.se>
	<20140314161649.GD12929@edge>
	<20140321142643.GA1479@ad.chargestorm.se>
	<20140402075039.GA5988@ad.chargestorm.se>
	<20140407223700.GC12929@edge>
MIME-Version: 1.0
In-Reply-To: <20140407223700.GC12929@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Issue building gcc-cross-initial
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
X-List-Received-Date: Tue, 08 Apr 2014 01:04:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Apr 07, 2014 at 06:37:01PM -0400, Denys Dmytriyenko wrote:
> Ok, it took me some time and effort (the error is severely misleading), but I 
> was finally able to trace down what causes the breakage in the internal 
> toolchain:
> 
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=e9797a456c99c890e5ff62334b7d65e1ff7db676
> 
> The addition of libc-headers version used for the platform into the 
> PACKAGE_ARCH causes gcc-cross-initial to not find binutils binaries during 
> bootstrap.
> 
> I'm still trying to figure out if it would be possible to unbreak the build, 
> while keeping the change, but at least it should be possible to have a quick 
> workaround for now...

And this seems to have resolved the issue:

STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-${TARGET_OS}"

Still testing it...


> On Wed, Apr 02, 2014 at 09:50:41AM +0200, Anders Darander wrote:
> > Ping...
> > 
> > * Anders Darander <anders@chargestorm.se> [140321 15:30]:
> > 
> > > * Denys Dmytriyenko <denys@ti.com> [140314 17:17]:
> > 
> > > > Yeah, I'm seeing the same breakage even in dylan - I'm looking into it now...
> > 
> > > Good to know that I'm not alone in seeing this...
> > 
> > > Any ideas regarding the root cause or possible fixes? Sofar, I've been
> > > occupied with work on our old release branch, though soon Ḯ'll start
> > > working on the update again.
> > 
> > > Cheers,
> > > Anders
> > 
> > > > On Mon, Mar 10, 2014 at 01:14:28PM +0100, Anders Darander wrote:
> > > > > Hi,
> > 
> > > > > Summary:
> > 
> > > > > I'm attempting at moving a custom product from meta-arago (danny) to the
> > > > > latest master based on dora.
> > 
> > > > > However, I'm getting issues when I'm building gcc-cross-initial (we're
> > > > > not using an external toolchain).i
> > 
> > > > > I've seen this on my normal build machine running Ubuntu 12.04, though
> > > > > my example below was running a new OpenSuse machine. 
> > > > > The choice of MACHINE="am37x-evm" is made to get something resembling
> > > > > our real machine.
> > 
> > > > > When building gcc-cross-initial, libgcc fails to identify the "suffix of
> > > > > object files" when the configure-script for libgcc is being run.
> > 
> > > > > I hope that someone can help me with some ideas/pointers as to how this
> > > > > can be resolved. I've got the same issue with both gcc 4.7.2 and
> > > > > 4.8.1...
> > -- 
> > Anders Darander
> > ChargeStorm AB / eStorm AB
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

