Return-Path: <devin@jd2.com>
Received: from smtp66.ord1c.emailsrvr.com (smtp66.ord1c.emailsrvr.com
	[108.166.43.66])
	by arago-project.org (Postfix) with ESMTPS id 1DCD452979
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 17:42:46 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id
	5396D380416; Fri, 29 Aug 2014 13:42:45 -0400 (EDT)
X-Virus-Scanned: OK
Received: by smtp1.relay.ord1c.emailsrvr.com (Authenticated sender:
	devin-AT-jd2.com) with ESMTPSA id DDA19380420; 
	Fri, 29 Aug 2014 13:42:44 -0400 (EDT)
X-Sender-Id: devin@jd2.com
Received: from DEVINWIN (tn-76-5-156-138.sta.embarqhsd.net [76.5.156.138])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:465 (trex/5.2.10); Fri, 29 Aug 2014 17:42:45 GMT
From: "Devin Hughes" <devin@jd2.com>
To: "'Denys Dmytriyenko'" <denys@ti.com>
References: <003101cfc132$d793d8b0$86bb8a10$@jd2.com>
	<20140826142126.GN23523@edge>
	<003f01cfc397$28a0ab50$79e201f0$@jd2.com>
	<8F29D6B095ED194EA1980491A5E029710C721666@DFLE08.ent.ti.com>
	<000501cfc3a2$080ad680$18208380$@jd2.com>
	<20140829164537.GH18620@edge>
In-Reply-To: <20140829164537.GH18620@edge>
Date: Fri, 29 Aug 2014 13:42:38 -0400
Message-ID: <000901cfc3b0$a075f860$e161e920$@jd2.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQFbvSfBAj06lxCpg4PnJP1Mmrf/iAKX9m2kAcx67cwBsvx8FQHVE/YQATiz076chryboA==
Cc: meta-arago@arago-project.org, "'Cooper Jr., Franklin'" <fcooper@ti.com>
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
X-List-Received-Date: Fri, 29 Aug 2014 17:42:46 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us



> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Friday, August 29, 2014 12:46 PM
> To: Devin Hughes
> Cc: 'Cooper Jr., Franklin'; meta-arago@arago-project.org
> Subject: Re: [meta-arago] Building meta-arago daisy
> 
> On Fri, Aug 29, 2014 at 11:58:09AM -0400, Devin Hughes wrote:
> > > > [Devin Hughes] Is the daisy configured build stable? I rebuilt the
> > > > image yesterday after the servers returned and it seems to run
> > > > unexpectedly. No boot errors, but the touchscreen and application
> > > > performance seem worse than the SDK release.
> > > [Franklin] Can you explain what you mean in terms of application
> > performance
> > > issues?
> > [Devin Hughes] Performance was the wrong choice of words now that I
> > know about the touchscreen trouble. It's more the permanent title bar
> > and lack of screen updates after closing an application. For instance,
> > after running one of the 3d demos in matrix gui, the title bar shows
> > the last opengl rendering on the top of the lcd.
> 
> 3D demos don't talk to Wayland stack and they take over fbdev completely
and
> previously Qt4-based refresh-screen app was used to update the screen
> afterwards.
> 
[Devin Hughes] This makes sense. 
> 
> > > I am going to build a customized image as a test next,
> > > > and I was thinking arago-base from daisy would be a good starting
> > > > point since I would like qt 5.2 or greater.
> > > [Franklin] So by default we are using Wayland/Weston and for Qt 5 we
> > > are
> > using
> > > the Wayland compositor. However, there are several touch screen
> > > related
> > bugs
> > > in Weston and Qt 5 that we are working with the Qt 5 and Weston team
> > > to address. It will take some time to fix so if acceptable I would
> > > recommend
> > just
> > > using a usb mouse as a work around for now if your running into
> > > those
> > problems
> > > also.
> > [Devin Hughes] USB mouse would be fine for me, but libusb is failing
> > to initialize. In dmesg I can see musb_init_controller failures, and
> > the platform driver reports a deferred probe. The only similar
> > information I can find on google describes improperly configured
> > device tree sources, but the fixes are already included in the daisy
> > referenced kernel.
> 
> Hmm, you said that is with 335x SK, right? I haven't seen this on
BeagleBone
> Black or 335x EVM. I'll try to see if I can reproduce it with SK...
[Devin Hughes] Yes, it's the 335x SK, and a vanilla arago-daisy conf with
gcc-4.7. No custom layers have been added yet.
> 
> --
> Denys


