Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9596F52A62
	for <meta-arago@arago-project.org>;
	Fri, 28 Jun 2013 17:53:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5SHrv8k028828
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2013 12:53:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5SHrvfd013671
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2013 12:53:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 28 Jun 2013 12:53:56 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5SHru5f028109;
	Fri, 28 Jun 2013 12:53:56 -0500
Date: Fri, 28 Jun 2013 13:53:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130628175356.GD32141@edge>
References: <4F9216F96E5DF9428610502835A9F49054936128@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49054936128@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Help needed: (Resend) Failures with nbench
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
X-List-Received-Date: Fri, 28 Jun 2013 17:54:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 27, 2013 at 11:56:50AM -0400, Nelson, Sam wrote:
>    Hello all,
> 
>    We are encountering the following error very often in our nightly builds.
>    Other times it works fine.
> 
>    The reason seems to be due to the make process trying to compile before
>    the touch pointer.h succeeds.
> 
>    See highlighted text in red.
> 
>    Not sure if this is because of the -j 4.
> 
>    Anybody else have seen this issue.  Appreciate your comments and help in
>    resolving this issue.

Sam,

I haven't seen this failure and we are building nbench in our nightly builds 
as well, using -j 16 and even higher.

From your description of the problem it looks like a race condition. You can 
try adding this line to the recipe to force building nbench package in a 
single thread - see if it helps:

PARALLEL_MAKE = ""

-- 
Denys


>    NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Started
> 
>    ERROR: Function failed: do_compile (see
>    /home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/log.do_compile.28346
>    for further information)
> 
>    ERROR: Logfile of failure stored in:
>    /home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/log.do_compile.28346
> 
>    Log data follows:
> 
>    | DEBUG: Executing shell function do_compile
> 
>    | NOTE: make -j 4 -e MAKEFLAGS=
> 
>    | touch pointer.h ;
> 
>    | arm-linux-gnueabihf-gcc  -march=armv7-a    -marm -mthumb-interwork
>    -mfloat-abi=hard -mfpu=neon -mtune=cortex-a15 
>    -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protector
>    -D_FORTIFY_SOURCE=1 -O2 -pipe -g -feliminate-unused-debug-types 
>    -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib
>    -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1
>    -Wl,--hash-style=gnu
>    --sysroot=/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/sysroots/keystone-evm 
>    -DLINUX  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include 
>    -fstack-protector -D_FORTIFY_SOURCE=1 -O2 -pipe -g
>    -feliminate-unused-debug-types\
> 
>    |              -c misc.c
> 
>    | ./sysinfo.sh arm-linux-gnueabihf-gcc  -march=armv7-a    -marm
>    -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a15 
>    -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protector
>    -D_FORTIFY_SOURCE=1 -O2 -pipe -g -feliminate-unused-debug-types 
>    -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib
>    -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1
>    -Wl,--hash-style=gnu
>    --sysroot=/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/sysroots/keystone-evm 
>    -DLINUX  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include 
>    -fstack-protector -D_FORTIFY_SOURCE=1 -O2 -pipe -g
>    -feliminate-unused-debug-types
> 
>    | ./sysinfo.sh arm-linux-gnueabihf-gcc  -march=armv7-a    -marm
>    -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a15 
>    -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protector
>    -D_FORTIFY_SOURCE=1 -O2 -pipe -g -feliminate-unused-debug-types 
>    -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib
>    -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1
>    -Wl,--hash-style=gnu
>    --sysroot=/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/sysroots/keystone-evm 
>    -DLINUX  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include 
>    -fstack-protector -D_FORTIFY_SOURCE=1 -O2 -pipe -g
>    -feliminate-unused-debug-types
> 
>    | In file included from misc.h:36:0,
> 
>    |                  from misc.c:23:
> 
>    | nmglobal.h:29:21: fatal error: pointer.h: No such file or directory
> 
>    | compilation terminated.
> 
>    | make: *** [misc.o] Error 1
> 
>    | make: *** Waiting for unfinished jobs....
> 
>    | ERROR: oe_runmake failed
> 
>    | ERROR: Function failed: do_compile (see
>    /home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/nbench-byte-2.2.3-r0/temp/log.do_compile.28346
>    for further information)
> 
>    NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Failed
> 
>    ERROR: Task 2812
>    (/home/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/sources/meta-openembedded/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb,
>    do_compile) failed with exit code '1'
> 
>    WARNING: QA Issue: syslog-ng: Files/directories were installed but not
>    shipped
> 
>     

