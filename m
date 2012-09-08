Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTP id 3655A52A0B
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 17:38:51 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MA1005UIL0QA3A3@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 08 Sep 2012 12:38:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F3E83201CD; Sat,
	08 Sep 2012 13:38:49 -0400 (EDT)
Date: Sat, 08 Sep 2012 13:38:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120908173849.GE23896@denix.org>
References: <1346976237-18449-1-git-send-email-fcooper27jr@gmail.com>
	<7D46E86EC0A8354091174257B2FED101591DDA07@DLEE12.ent.ti.com>
	<7F14B13F-2AE6-4F01-9612-23A1DBB11022@ti.com>
MIME-version: 1.0
In-reply-to: <7F14B13F-2AE6-4F01-9612-23A1DBB11022@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH] task-arago-tisdk-connectivity: Add	bluetooth stack
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
X-List-Received-Date: Sat, 08 Sep 2012 17:38:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Sep 08, 2012 at 04:01:42PM +0000, Cooper Jr., Franklin wrote:
> There are quite a bit of patches that need to be renamed that still haven't 
> been committed. I would prefer sending a single patch that renames all of 
> the tasks once the patches are committed.

I understand your position on this, but all the previous patches were 
submitted to drop the toolchain part from the name - will you be able to 
separate them afterwards?

Denys


> On Sep 8, 2012, at 10:58 AM, "Maupin, Chase" <chase.maupin@ti.com> wrote:
> 
> > Will you re-submit with new naming?
> > 
> > Sincerely,
> > Chase Maupin
> > Software Applications
> > ARM MPU
> > e-mail: chase.maupin@ti.com
> > phone: (214) 567-2950
> > 
> > For support:
> > Forums - http://community.ti.com/forums/
> > Wiki - http://wiki.davincidsp.com/ 
> > 
> > 
> >> -----Original Message-----
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> >> Sent: Thursday, September 06, 2012 7:04 PM
> >> To: meta-arago@arago-project.org
> >> Cc: Franklin S. Cooper Jr
> >> Subject: [meta-arago] [meta-arago-distro][PATCH] task-arago-
> >> tisdk-connectivity: Add bluetooth stack
> >> 
> >> * Add list of bluetooth stack libraries to task-arago-tisdk-
> >> connectivity.
> >> * This list was previously located in task-arago-tisdk-bsp and
> >>  task-arago-toolchain-tisdk-bsp-target in arago.
> >> 
> >> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> >> ---
> >> .../tasks/task-arago-tisdk-connectivity-target.bb  |    9
> >> ++++++++-
> >> .../tasks/task-arago-tisdk-connectivity.bb         |   16
> >> +++++++++++++---
> >> 2 files changed, 21 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> >> tisdk-connectivity-target.bb b/meta-arago-distro/recipes-
> >> core/tasks/task-arago-tisdk-connectivity-target.bb
> >> index deb7b7b..a63c801 100644
> >> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> >> connectivity-target.bb
> >> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> >> connectivity-target.bb
> >> @@ -1,12 +1,19 @@
> >> DESCRIPTION = "Task to install wlan and bluetooth sources in
> >> SDK"
> >> LICENSE = "MIT"
> >> LIC_FILES_CHKSUM =
> >> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b
> >> 4de20420"
> >> -PR = "r0"
> >> +PR = "r1"
> >> 
> >> inherit task
> >> PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> COMPATIBLE_MACHINE = "(am37x-evm|am180x-evm|ti33x)"
> >> 
> >> +# Bluetooth development packages
> >> +BLUETOOTH_STACK = "\
> >> +    bluez4-dev \
> >> +    openobex-dev \
> >> +"
> >> +
> >> RDEPENDS_${PN} = "\
> >> +    ${BLUETOOTH_STACK} \
> >>     wpa-supplicant-dev \
> >>     "
> >> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> >> tisdk-connectivity.bb b/meta-arago-distro/recipes-
> >> core/tasks/task-arago-tisdk-connectivity.bb
> >> index 1ff849c..17f97d1 100644
> >> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> >> connectivity.bb
> >> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> >> connectivity.bb
> >> @@ -1,7 +1,7 @@
> >> DESCRIPTION = "Task to install wlan and bluetooth packages into
> >> target FS"
> >> LICENSE = "MIT"
> >> LIC_FILES_CHKSUM =
> >> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b
> >> 4de20420"
> >> -PR = "r0"
> >> +PR = "r1"
> >> 
> >> inherit task
> >> PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> @@ -42,10 +42,20 @@ WLAN_COMPAT = "ti-compat-wireless-wl12xx \
> >>                bt-enable \
> >> "
> >> 
> >> -BLUETOOTH = "bluetooth-gui"
> >> +BLUETOOTH_STACK = "\
> >> +    bluez4 \
> >> +    bluez4-agent \
> >> +    libasound-module-bluez \
> >> +    bluez-hcidump \
> >> +    openobex \
> >> +    openobex-apps \
> >> +    obexftp \
> >> +    ussp-push \
> >> +    "
> >> 
> >> RDEPENDS_${PN} = "\
> >>     ${WLAN_COMMON} \
> >>     ${WLAN_COMPAT} \
> >> -    ${BLUETOOTH} \
> >> +    ${BLUETOOTH_STACK} \
> >> +    bluetooth-gui \
> >> "
> >> --
> >> 1.7.0.4
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

