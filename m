Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id A180E52A0B
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 17:34:27 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MA1001RLKT0H0MQ@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 08 Sep 2012 12:34:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 30847201B8; Sat,
	08 Sep 2012 13:34:12 -0400 (EDT)
Date: Sat, 08 Sep 2012 13:34:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120908173412.GD23896@denix.org>
References: <1347044999-25201-1-git-send-email-fcooper27jr@gmail.com>
	<7D46E86EC0A8354091174257B2FED101591DD99D@DLEE12.ent.ti.com>
	<03486037-E0B7-4025-898E-93D2E2517F58@ti.com>
	<20120908172400.GB23896@denix.org>
	<2EE4798B-19EE-4C3E-A2F4-2A8F6F3A3205@ti.com>
MIME-version: 1.0
In-reply-to: <2EE4798B-19EE-4C3E-A2F4-2A8F6F3A3205@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH 1/2 v2] pinmux-utility: Add	pinmux utility
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
X-List-Received-Date: Sat, 08 Sep 2012 17:34:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Sep 08, 2012 at 05:27:39PM +0000, Cooper Jr., Franklin wrote:
> That makes sense. Will do.

BTW, some other things, see below...


> On Sep 8, 2012, at 12:24 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> 
> > On Sat, Sep 08, 2012 at 04:16:42PM +0000, Cooper Jr., Franklin wrote:
> >> I'm unsure about this. I would think that is the point of an app or 
> >> library's release notes.
> > 
> > No, what Chase meant is for re-submition of the patches, it's common to 
> > explain what's different between v1 and v2 of the same patch. It's usually 
> > done after the --- line and before the actual diff, as that part is lost and 
> > won't go into the git commit description. See below...
> > 
> > 
> >> On Sep 8, 2012, at 10:52 AM, "Maupin, Chase" <chase.maupin@ti.com> wrote:
> >> 
> >>> Please start adding
> >>> 
> >>> ---
> >>> Update in version x
> >>>   * item 1
> >>>   * item 2
> >>> 
> >>> 
> >>> That way we know why there is a new version.
> >>> 
> >>>> -----Original Message-----
> >>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >>>> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> >>>> Sent: Friday, September 07, 2012 2:10 PM
> >>>> To: meta-arago@arago-project.org
> >>>> Cc: Franklin S. Cooper Jr
> >>>> Subject: [meta-arago] [meta-arago-distro][PATCH 1/2 v2] pinmux-
> >>>> utility: Add pinmux utility
> >>>> 
> >>>> * Add Windows base pinmux utility
> >>>> * Port pinmux-utility recipe from arago.
> >>>> * The current recipe pulls in a zip file that doesn't contain
> >>>> license information. License information will be added in an
> >>>> updated recipe.
> >>>> 
> >>>> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>

This gmail email is undeliverable for me. Moreover, you should probably sign 
off your changes with your TI address. Please do git-config in your 
repository, so your patches are generated with the correct From: and SOB: 
lines. You can still send them from gmail, though.


> >>>> ---
> > 
> > Here is the proper place for any comments you don't want to go into the commit 
> > description, such as the reason for resubmitting the patch. Like this:
> > 
> > * Version 2 of the patch addresses comments about blah.
> > 
> > 
> >>>> .../pinmux-utility/pinmux-utility.inc              |   19
> >>>> +++++++++++++++
> >>>> .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |   25
> >>>> ++++++++++++++++++++
> >>>> 2 files changed, 44 insertions(+), 0 deletions(-)
> >>>> create mode 100644 meta-arago-distro/recipes-arago/pinmux-
> >>>> utility/pinmux-utility.inc
> >>>> create mode 100644 meta-arago-distro/recipes-arago/pinmux-
> >>>> utility/pinmux-utility_2.3.1.0.bb
> >>>> 
> >>>> diff --git a/meta-arago-distro/recipes-arago/pinmux-
> >>>> utility/pinmux-utility.inc b/meta-arago-distro/recipes-
> >>>> arago/pinmux-utility/pinmux-utility.inc
> >>>> new file mode 100644
> >>>> index 0000000..46d409d
> >>>> --- /dev/null
> >>>> +++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-
> >>>> utility.inc
> >>>> @@ -0,0 +1,19 @@
> >>>> +DESCRIPTION = "Texas Instruments Pinmux Utility"
> >>>> +LICENSE = "BSD"
> >>>> +
> >>>> +PR = "r0"
> >>>> +
> >>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>> +
> >>>> +S = "${WORKDIR}/${P}"
> >>>> +
> >>>> +installdir = "host-tools/pinmux_utils/windows"
> >>>> +
> >>>> +do_install() {
> >>>> +    install -d ${D}/${installdir}
> >>>> +    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
> >>>> +    install ${S}/setup.exe ${D}/${installdir}
> >>>> +    install ${S}/Release_Notes.txt ${D}/${installdir}
> >>>> +}
> >>>> +
> >>>> +FILES_${PN} += "${installdir}/*"
> >>>> diff --git a/meta-arago-distro/recipes-arago/pinmux-
> >>>> utility/pinmux-utility_2.3.1.0.bb b/meta-arago-distro/recipes-
> >>>> arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
> >>>> new file mode 100644
> >>>> index 0000000..e966f3a
> >>>> --- /dev/null
> >>>> +++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-
> >>>> utility_2.3.1.0.bb
> >>>> @@ -0,0 +1,25 @@
> >>>> +require pinmux-utility.inc
> >>>> +
> >>>> +PR_append = "-arago0"
> >>>> +
> >>>> +SRC_URI = "\
> >>>> +
> >>>> https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxUtili
> >>>> ty_v2_03_01_00.zip;name=base;subdir=${P} \
> >>>> +"
> >>>> +SRC_URI[base.md5sum] = "31f28b06f72c042e5400fc53b4a29c0e"
> >>>> +SRC_URI[base.sha256sum] =
> >>>> "2b0de3592c5f4b803a207d092dba227d10e1af65e0d4f06e1d8d23f317a452f9
> >>>> "
> >>>> +
> >>>> +# Currently for omapl138 devices we are using a different pinmux
> >>>> utility
> >>>> +# program.  This requires a separate SRC_URI as well as a
> >>>> different
> >>>> +# do_install.
> >>>> +SRC_URI_omapl138 = "\
> >>>> +
> >>>> https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_A
> >>>> M18xx_01_00_1076_03.zip;name=omapl138;subdir=${P} \
> >>>> +"
> >>>> +
> >>>> +do_install_omapl138() {
> >>>> +    install -d ${D}/${installdir}
> >>>> +    cp -rf ${S}/bin ${D}/${installdir}/
> >>>> +    cp -rf ${S}/configurations ${D}/${installdir}/
> >>>> +}
> >>>> +
> >>>> +SRC_URI[omapl138.md5sum] = "5a4eb834bde44c662aaf669882adbfe6"
> >>>> +SRC_URI[omapl138.sha256sum] =
> >>>> "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0
> >>>> "
> >>>> --
> >>>> 1.7.0.4
> >>>> 
> >>>> _______________________________________________
> >>>> meta-arago mailing list
> >>>> meta-arago@arago-project.org
> >>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>> _______________________________________________
> >>> meta-arago mailing list
> >>> meta-arago@arago-project.org
> >>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

