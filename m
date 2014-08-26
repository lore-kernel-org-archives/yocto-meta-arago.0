Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 95BCA52976
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 14:21:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7QELSlt022682;
	Tue, 26 Aug 2014 09:21:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7QELRgc021607;
	Tue, 26 Aug 2014 09:21:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 26 Aug 2014 09:21:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7QELRLg014071;
	Tue, 26 Aug 2014 09:21:27 -0500
Date: Tue, 26 Aug 2014 10:21:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Devin Hughes <devin@jd2.com>
Message-ID: <20140826142126.GN23523@edge>
References: <003101cfc132$d793d8b0$86bb8a10$@jd2.com>
MIME-Version: 1.0
In-Reply-To: <003101cfc132$d793d8b0$86bb8a10$@jd2.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Building meta-arago daisy
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
X-List-Received-Date: Tue, 26 Aug 2014 14:21:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi, Devin,

On Tue, Aug 26, 2014 at 09:37:11AM -0400, Devin Hughes wrote:
> I am trying to build the daisy branch for my 335x-EVMSK. The build is setup
> using arago-daisy-config.txt, and I am using the internal linaro compiler. I
> get the same results described using the external linaro gcc4.7 toolchain
> mentioned on the wiki page. I have run into a couple of problems:
> 
> 1.      The arago-base-tisdk-image builds successfully and boots on the SK,
> but the splash screen fails to show with failure to find /dev/fb0 in dmesg.
> After the boot is complete, I can manually display the splash properly. This
> makes me think psplash is running before the lcd modules are loaded, and I
> was curious if any of you have seen this behavior.

Yes, it's a known issue, but not a critical one, so not yet being addressed.


> 2.  Building arago-core-tisdk-image fails when building qt 5.2.1 with (from
> log.do_compile):
> 
> 
> /home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon-oe-linux
> -gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/tools/qdoc/q
> uoter.cpp: In constructor 'Quoter::Quoter()':
> 
> /home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon-oe-linux
> -gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/tools/qdoc/q
> uoter.cpp:139:1: internal compiler error: in add_stores, at
> var-tracking.c:5918

Internal compiler error in qtbase is also a known issue with Linaro toolchain 
gcc-4.8 and Linaro developers are looking into it already. Right now we are 
using gcc-4.7 (2013.03) and evaluating gcc-4.9...

-- 
Denys


> }
> 
> ^
> 
> Please submit a full bug report,
> 
> with preprocessed source if appropriate.
> 
> See <http://gcc.gnu.org/bugs.html> for instructions.
> 
> make[2]: *** [.obj/quoter.o] Error 1
> 
> make[2]: *** Waiting for unfinished jobs....
> 
>  
> 
> Any guidance is greatly appreciated.
> 
>  
> 
> Regards,
> 
> Devin Hughes
> 
>  
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


