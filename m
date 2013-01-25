Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 3361D52ADE
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 22:50:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH7003AJE400K83@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 25 Jan 2013 16:50:25 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 605AD201C0; Fri,
	25 Jan 2013 17:50:24 -0500 (EST)
Date: Fri, 25 Jan 2013 17:50:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20130125225024.GG23977@denix.org>
References: <CA+edY+Tw5JtFgevWy8hWNA7wH8ykuKV=W4Eq1yqo1Vq0jMtyLw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101593A25DB@DLEE12.ent.ti.com>
	<CA+edY+Teh+82ZozQx4hYL-uGkp-kG=8E6h1EMGB=F=_aNi0xUw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101593A4880@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED101593A4880@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: newbie question: license.manifest vs. package.manifest vs. opkg list
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
X-List-Received-Date: Fri, 25 Jan 2013 22:50:55 -0000
Content-type: text/plain; charset=utf-8
Content-disposition: inline
Content-transfer-encoding: 8bit

On Fri, Jan 25, 2013 at 10:33:29PM +0000, Maupin, Chase wrote:
> Paul,
> 
> The license.bbclass which creates these files is making a list of installed 
> packages (package.manifest) from the image, and then trying to look in the 
> following directory for a file with that name to parse the data from:
> 
> ${TMPDIR}/pkgdata/*/runtime -name ${pkg}
> 
> However, in that directory for example the libasound2 package information is 
> in a file called libasound without the 2.  Hence it finds no information and 
> doesn’t make an entry.  This seems to have something to do with the number 
> that is added to the name of the package, but which is not in the name of 
> the PACKAGE as it is defined in the PACKAGES variable.
> 
> I have not yet been able to track down why this is occuring.  I see output 
> in the log files like:
> 
> log.do_package_write_ipk:Packaged contents of libasound into 
> /home/a0271661/projects/yocto-training/build-setup/oe-layersetup/build/arago-tmp-external-arago-toolchain/work/armv7a-vfp-neon-oe-linux-gnueabi/alsa-lib-1.0.25-r1/deploy-ipks/armv7a-vfp-neon/libasound2_1.0.25-r1_armv7a-vfp-neon.ipk
> 
> Which indicates that somewhere in the do_package_write_ipk function the 
> libasound was changed to libasound2.  What is causing me grief is that I 
> cannot find where this message is being printed to look at the code around 
> it :(

Chase,

It is the expected behavious and is called "Debian Library Packaging Guide" 
[1][2] and is handled by the debian.bbclass [3] that is inherited by default 
in our Arago/meta-arago distro.

[1] http://www.netfort.gr.jp/~dancer/column/libpkg-guide/libpkg-guide.html#naminglibpkg
[2] http://www.debian.org/doc/debian-policy/ch-sharedlibs.html
[3] http://cgit.openembedded.org/openembedded-core/tree/meta/classes/debian.bbclass

-- 
Denys


> The kind of good news is that it looks like the core package (like alsa-lib) 
> is in the manifest with the license, but I’d still like to resolve this 
> mystery.
> 
> Sincerely,
> Chase Maupin
> Integration Team Manager
> Linux Core Product Development
> e-mail: chase.maupin@ti.com
> phone: (214) 567-2950
> 
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/
> 
> From: Paul Kovitz [mailto:paul.kovitz@welchallyn.com]
> Sent: Friday, January 25, 2013 11:46 AM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] newbie question: license.manifest vs. package.manifest vs. opkg list
> 
> Hi Chase. Thanks for the help. For the arago-base-image I generated, the following files are in package.manifest but not in license.manifest:
> libasound2
> libcrypto1.0.0
> libcurl5
> liblzo2-2
> libopkg1
> libssl1.0.0
> libtinfo5
> libusb-0.1-4
> libusb-1.0-0
> libuuid1
> libz1
> 
> 
> 
> On Fri, Jan 25, 2013 at 6:59 AM, Maupin, Chase <chase.maupin@ti.com<mailto:chase.maupin@ti.com>> wrote:
> Paul,
> 
> Can you give some examples of a package listed in the package.manifest that is not in the license.manifest file?
> 
> Sincerely,
> Chase Maupin
> Integration Team Manager
> Linux Core Product Development
> e-mail: chase.maupin@ti.com<mailto:chase.maupin@ti.com>
> phone: (214) 567-2950<tel:%28214%29%20567-2950>
> 
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/
> 
> From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-project.org> [mailto:meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-project.org>] On Behalf Of Paul Kovitz
> Sent: Thursday, January 24, 2013 7:15 PM
> To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: [meta-arago] newbie question: license.manifest vs. package.manifest vs. opkg list
> 
> I am using the 05.06.00.00 baseline. I have an image recipe that I created by removing some packages from tisdk-rootfs-image.bb<http://tisdk-rootfs-image.bb>, changing the ARAGO_QT_PROVIDER_armv7a from qt4-embedded-gles to qt4-embedded and making edits to task-arago-tisdk-graphics.bb<http://task-arago-tisdk-graphics.bb> and task-arago-tisdk-matrix.bb<http://task-arago-tisdk-matrix.bb> to not use packages that rely on opengl-es to run. The image worked as expected on the target hardware for the tests I ran.
> 
> I wanted to understand the licenses this build used, so I looked in build/arago-tmp-external-arago-toolchain/deploy/licenses/[my new image name] and saw the license.manifest and package.manifest files. To verify package.manifest, I looked at the packages the target displayed as a result of opkg list and compared the output package.manifest. The opkg list command listed two packages that are not in package.manifest. The other 288 package names match exactly. The same build has 69 more  package names in package.manifest than there are in license.manaifest. The other 219 package names match exactly.
> 
> I thought I must have done something wrong, so I built base-arago-image from the 05.06.00.00 release and looked at the arago-tmp-external-arago-toolchain/deploy/licenses/arago-base-image-am335x-evm-20130124231158 directory. There are 11 more package names in package.manifest than there are in license.manifest. The other 40 names match exactly.
> 
> Am I doing something wrong, or is this expected behavior, or perhaps both? Thanks in advance for the help.
> 
> --
> Paul Kovitz
> 
> 
> 
> 
> --
> Paul Kovitz
> Lead Embedded Software Engineer
> Welch Allyn
> 8500 SW Creekside Place
> Beaverton, OR 97008
> 503-530-7304 (voice)

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


