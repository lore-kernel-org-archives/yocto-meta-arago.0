Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id B02B852961
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 19:20:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJX003T39PP12Z1@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 19 Mar 2013 14:20:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E7E1220033; Tue,
	19 Mar 2013 15:20:12 -0400 (EDT)
Date: Tue, 19 Mar 2013 15:20:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130319192012.GI14761@denix.org>
References: <1186596819.57.1363666176762.JavaMail.jenkins@puget>
	<20130319175128.GR32759@edge>
	<8F29D6B095ED194EA1980491A5E029710C3EAA74@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C3EAA74@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [nightly] Core TISDK 2013.03 build 2013-03-18_23-01-06
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
X-List-Received-Date: Tue, 19 Mar 2013 19:20:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 19, 2013 at 06:59:07PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Tuesday, March 19, 2013 12:51 PM
> > To: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [nightly] Core TISDK 2013.03 build 2013-03-18_23-
> > 01-06
> > 
> > Ok, the build results are now much better!
> > 
> > The only broken build is for the beagleboard with the latest Graphics SDK and I
> > believe Franklin already has a fix for that - I'll wait for a patch.
> 
> Beagleboard builds fine I had one kernel panic but that was a onetime 
> runtime issue and we couldn't conclude if it was a Graphics issue or not. 
> What was the build failure?

Bunch of OMAP_DSS_UPDATE_* undefined in services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c

It's kernel 3.3.7 and linux-libc-headers 3.2 - is there anything else missing? 
What about that fix you pointed me yesterday with failed "cp"?

Here's the actual log around the failure:

ERROR: Function failed: do_compile (see /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/temp/log.do_compile.3137 for further information)
ERROR: Logfile of failure stored in: /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/temp/log.do_compile.3137
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 12 -e MAKEFLAGS= KERNEL_PATH=/OE/arago-tmp-external-arago-toolchain/sysroots/beagleboard/usr/src/kernel KERNEL_SRC=/OE/arago-tmp-external-arago-toolchain/sysroots/beagleboard/usr/src/kernel KERNEL_VERSION=3.3.7 CC=arm-arago-linux-gnueabi-gcc  -mno-thumb-interwork -marm LD=arm-arago-linux-gnueabi-ld   AR=arm-arago-linux-gnueabi-ar  BUILD=release TI_PLATFORM=omap3630 SUPPORT_XORG=0
| make -C /OE/arago-tmp-external-arago-toolchain/sysroots/beagleboard/usr/src/kernel M=`pwd`
| make[1]: Entering directory `/OE/arago-tmp-external-arago-toolchain/sysroots/beagleboard/usr/src/kernel'
|   CC [M]  /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.o
|   LD [M]  /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bufferclass_ti.o
|   CC [M]  /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_displayclass.o
|   CC [M]  /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.o
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: In function 'OMAPLFBCreateSwapQueue':
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:284:29: error: 'WQ_FREEZEABLE' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:284:29: note: each undeclared identifier is reported only once for each function it appears in
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: At top level:
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:421:55: warning: 'enum omap_dss_update_mode' declared inside parameter list
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:421:55: warning: its scope is only this definition or declaration, which is probably not what you want
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:421:76: error: parameter 1 ('eMode') has incomplete type
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:421:21: warning: function declaration isn't a prototype
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: In function 'OMAPLFBValidateDSSUpdateMode':
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:425:8: error: 'OMAP_DSS_UPDATE_AUTO' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:426:8: error: 'OMAP_DSS_UPDATE_MANUAL' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:427:8: error: 'OMAP_DSS_UPDATE_DISABLED' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: At top level:
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:436:58: warning: 'enum omap_dss_update_mode' declared inside parameter list
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:436:79: error: parameter 1 ('eMode') has incomplete type
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:436:28: warning: function declaration isn't a prototype
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: In function 'OMAPLFBFromDSSUpdateMode':
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:440:8: error: 'OMAP_DSS_UPDATE_AUTO' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:442:8: error: 'OMAP_DSS_UPDATE_MANUAL' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:444:8: error: 'OMAP_DSS_UPDATE_DISABLED' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: At top level:
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:469:34: error: return type is an incomplete type
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: In function 'OMAPLFBToDSSUpdateMode':
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:474:11: error: 'OMAP_DSS_UPDATE_AUTO' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:474:4: warning: 'return' with a value, in function returning void
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:476:11: error: 'OMAP_DSS_UPDATE_MANUAL' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:476:4: warning: 'return' with a value, in function returning void
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:478:11: error: 'OMAP_DSS_UPDATE_DISABLED' undeclared (first use in this function)
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:478:4: warning: 'return' with a value, in function returning void
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:483:2: warning: 'return' with a value, in function returning void
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: At top level:
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:421:21: warning: 'OMAPLFBValidateDSSUpdateMode' defined but not used
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:436:28: warning: 'OMAPLFBFromDSSUpdateMode' defined but not used
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:454:21: warning: 'OMAPLFBValidateUpdateMode' defined but not used
| /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:469:34: warning: 'OMAPLFBToDSSUpdateMode' defined but not used
| make[3]: *** [/OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.o] Error 1
| make[2]: *** [/OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux] Error 2
| make[1]: *** [_module_/OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/Graphics_SDK_4_08_00_01/GFX_Linux_KM] Error 2
| make[1]: Leaving directory `/OE/arago-tmp-external-arago-toolchain/sysroots/beagleboard/usr/src/kernel'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /OE/arago-tmp-external-arago-toolchain/work/beagleboard-oe-linux-gnueabi/omap3-sgx-modules-4.08.00.01-r123a/temp/log.do_compile.3137 for further information)

