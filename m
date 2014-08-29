Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A6E4052A3F
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 16:45:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7TGjc0A006133;
	Fri, 29 Aug 2014 11:45:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7TGjc2P030407;
	Fri, 29 Aug 2014 11:45:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 11:45:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7TGjcTs021101;
	Fri, 29 Aug 2014 11:45:38 -0500
Date: Fri, 29 Aug 2014 12:45:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Devin Hughes <devin@jd2.com>
Message-ID: <20140829164537.GH18620@edge>
References: <003101cfc132$d793d8b0$86bb8a10$@jd2.com>
	<20140826142126.GN23523@edge>
	<003f01cfc397$28a0ab50$79e201f0$@jd2.com>
	<8F29D6B095ED194EA1980491A5E029710C721666@DFLE08.ent.ti.com>
	<000501cfc3a2$080ad680$18208380$@jd2.com>
MIME-Version: 1.0
In-Reply-To: <000501cfc3a2$080ad680$18208380$@jd2.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 29 Aug 2014 16:45:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 29, 2014 at 11:58:09AM -0400, Devin Hughes wrote:
> > > [Devin Hughes] Is the daisy configured build stable? I rebuilt the
> > > image yesterday after the servers returned and it seems to run
> > > unexpectedly. No boot errors, but the touchscreen and application
> > > performance seem worse than the SDK release.
> > [Franklin] Can you explain what you mean in terms of application
> performance
> > issues?
> [Devin Hughes] Performance was the wrong choice of words now that I know
> about
> the touchscreen trouble. It's more the permanent title bar and lack of
> screen updates after closing an application. For instance, after running one
> of the 3d demos in matrix gui, the title bar shows the last opengl rendering
> on the top of the lcd.  

3D demos don't talk to Wayland stack and they take over fbdev completely and 
previously Qt4-based refresh-screen app was used to update the screen 
afterwards.


> > I am going to build a customized image as a test next,
> > > and I was thinking arago-base from daisy would be a good starting
> > > point since I would like qt 5.2 or greater.
> > [Franklin] So by default we are using Wayland/Weston and for Qt 5 we are
> using
> > the Wayland compositor. However, there are several touch screen related
> bugs
> > in Weston and Qt 5 that we are working with the Qt 5 and Weston team to
> > address. It will take some time to fix so if acceptable I would recommend
> just
> > using a usb mouse as a work around for now if your running into those
> problems
> > also.
> [Devin Hughes] USB mouse would be fine for me, but libusb is failing to
> initialize. In
> dmesg I can see musb_init_controller failures, and the platform driver
> reports a deferred
> probe. The only similar information I can find on google describes
> improperly configured
> device tree sources, but the fixes are already included in the daisy
> referenced kernel.

Hmm, you said that is with 335x SK, right? I haven't seen this on BeagleBone 
Black or 335x EVM. I'll try to see if I can reproduce it with SK...

-- 
Denys

