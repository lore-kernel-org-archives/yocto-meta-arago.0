Return-Path: <devin@jd2.com>
Received: from smtp82.ord1c.emailsrvr.com (smtp82.ord1c.emailsrvr.com
	[108.166.43.82])
	by arago-project.org (Postfix) with ESMTPS id 3F19152A6A
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 15:58:17 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp3.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id
	AF8EE18032A; Fri, 29 Aug 2014 11:58:16 -0400 (EDT)
X-Virus-Scanned: OK
Received: by smtp3.relay.ord1c.emailsrvr.com (Authenticated sender:
	devin-AT-jd2.com) with ESMTPSA id 4D5E8180C32; 
	Fri, 29 Aug 2014 11:58:16 -0400 (EDT)
X-Sender-Id: devin@jd2.com
Received: from DEVINWIN (tn-76-5-156-138.sta.embarqhsd.net [76.5.156.138])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:465 (trex/5.2.10); Fri, 29 Aug 2014 15:58:16 GMT
From: "Devin Hughes" <devin@jd2.com>
To: "'Cooper Jr., Franklin'" <fcooper@ti.com>
References: <003101cfc132$d793d8b0$86bb8a10$@jd2.com>	<20140826142126.GN23523@edge>
	<003f01cfc397$28a0ab50$79e201f0$@jd2.com>
	<8F29D6B095ED194EA1980491A5E029710C721666@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C721666@DFLE08.ent.ti.com>
Date: Fri, 29 Aug 2014 11:58:09 -0400
Message-ID: <000501cfc3a2$080ad680$18208380$@jd2.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQFbvSfBAj06lxCpg4PnJP1Mmrf/iAKX9m2kAcx67cwBsvx8FZyfCu0Q
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
X-List-Received-Date: Fri, 29 Aug 2014 15:58:17 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us



> -----Original Message-----
> From: Cooper Jr., Franklin [mailto:fcooper@ti.com]
> Sent: Friday, August 29, 2014 10:47 AM
> To: Devin Hughes; Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] Building meta-arago daisy
> 
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Devin Hughes
> > Sent: Friday, August 29, 2014 9:40 AM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] Building meta-arago daisy
> >
> > Hi Denys,
> >
> > > -----Original Message-----
> > > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > > Sent: Tuesday, August 26, 2014 10:21 AM
> > > To: Devin Hughes
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] Building meta-arago daisy
> > >
> > > Hi, Devin,
> > >
> > > On Tue, Aug 26, 2014 at 09:37:11AM -0400, Devin Hughes wrote:
> > > > I am trying to build the daisy branch for my 335x-EVMSK. The build
> > > > is
> > > setup
> > > > using arago-daisy-config.txt, and I am using the internal linaro
> > > compiler. I
> > > > get the same results described using the external linaro gcc4.7
> > > toolchain
> > > > mentioned on the wiki page. I have run into a couple of problems:
> > > >
> > > > 1.      The arago-base-tisdk-image builds successfully and boots on
the
> > > SK,
> > > > but the splash screen fails to show with failure to find /dev/fb0
> > > > in
> > > dmesg.
> > > > After the boot is complete, I can manually display the splash
properly.
> > > This
> > > > makes me think psplash is running before the lcd modules are
> > > > loaded, and
> > > I
> > > > was curious if any of you have seen this behavior.
> > >
> > > Yes, it's a known issue, but not a critical one, so not yet being
> > addressed.
> > [Devin Hughes] No problem, I think I will use the kernel splash as a
substitute.
> >
> > >
> > >
> > > > 2.  Building arago-core-tisdk-image fails when building qt 5.2.1
> > > > with
> > > (from
> > > > log.do_compile):
> > > >
> > > >
> > > >
> > > /home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon-
> > oe
> > > -lin
> > > ux
> > > >
> > > -gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/tool
> > > s/
> > > qdoc
> > > /q
> > > > uoter.cpp: In constructor 'Quoter::Quoter()':
> > > >
> > > >
> > > /home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon-
> > oe
> > > -lin
> > > ux
> > > >
> > > -gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/tool
> > > s/
> > > qdoc
> > > /q
> > > > uoter.cpp:139:1: internal compiler error: in add_stores, at
> > > > var-tracking.c:5918
> > >
> > > Internal compiler error in qtbase is also a known issue with Linaro
> > toolchain
> > > gcc-4.8 and Linaro developers are looking into it already. Right now
> > > we
> > are
> > > using gcc-4.7 (2013.03) and evaluating gcc-4.9...
> > [Devin Hughes] Is the daisy configured build stable? I rebuilt the
> > image yesterday after the servers returned and it seems to run
> > unexpectedly. No boot errors, but the touchscreen and application
> > performance seem worse than the SDK release.
> [Franklin] Can you explain what you mean in terms of application
performance
> issues?
[Devin Hughes] Performance was the wrong choice of words now that I know
about
the touchscreen trouble. It's more the permanent title bar and lack of
screen updates after closing an application. For instance, after running one
of the 3d demos in matrix gui, the title bar shows the last opengl rendering
on the top of the lcd.  
> I am going to build a customized image as a test next,
> > and I was thinking arago-base from daisy would be a good starting
> > point since I would like qt 5.2 or greater.
> [Franklin] So by default we are using Wayland/Weston and for Qt 5 we are
using
> the Wayland compositor. However, there are several touch screen related
bugs
> in Weston and Qt 5 that we are working with the Qt 5 and Weston team to
> address. It will take some time to fix so if acceptable I would recommend
just
> using a usb mouse as a work around for now if your running into those
problems
> also.
[Devin Hughes] USB mouse would be fine for me, but libusb is failing to
initialize. In
dmesg I can see musb_init_controller failures, and the platform driver
reports a deferred
probe. The only similar information I can find on google describes
improperly configured
device tree sources, but the fixes are already included in the daisy
referenced kernel.
> 
> > >
> > > --
> > > Denys
> > >
> > >
> > > > }
> > > >
> > > > ^
> > > >
> > > > Please submit a full bug report,
> > > >
> > > > with preprocessed source if appropriate.
> > > >
> > > > See <http://gcc.gnu.org/bugs.html> for instructions.
> > > >
> > > > make[2]: *** [.obj/quoter.o] Error 1
> > > >
> > > > make[2]: *** Waiting for unfinished jobs....
> > > >
> > > >
> > > >
> > > > Any guidance is greatly appreciated.
> > > >
> > > >
> > > >
> > > > Regards,
> > > >
> > > > Devin Hughes
> > > >
> > > >
> > > >
> > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


