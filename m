Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 05523529E7
	for <meta-arago@arago-project.org>;
	Tue, 17 May 2016 17:25:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4HHP9rs029141
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 12:25:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HHP9Wc003174
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 12:25:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 May 2016 12:25:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HHP94A026089;
	Tue, 17 May 2016 12:25:09 -0500
Date: Tue, 17 May 2016 13:24:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>
Message-ID: <20160517172453.GS16188@edge>
References: <1463390723-32245-1-git-send-email-anandb@ti.com>
	<20160516151240.GG16188@edge>
	<05CF4794C98B244ABDC620C10903762273299257@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <05CF4794C98B244ABDC620C10903762273299257@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/1] weston-init: add dependency on SGX DDK service
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
X-List-Received-Date: Tue, 17 May 2016 17:25:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Untill all the features of existing intiscript are converted to systemd units 
(calibration and reloading/restarting of udev/weston), we should stick to the 
old initscripts for now:

http://arago-project.org/pipermail/meta-arago/2016-May/007660.html

-- 
Denys


On Tue, May 17, 2016 at 12:42:28PM -0400, Balagopalakrishnan, Anand wrote:
> Denys,
> Agreed. The intent of the patch was to fix only the out of sequence 
> dependencies between DDK and Weston.
> 
> Eric,
> Is there a plan to update the Weston scripts to systemd?
> 
> Regards,
> Anand
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Monday, May 16, 2016 8:43 PM
> To: Balagopalakrishnan, Anand
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/1] weston-init: add dependency on SGX DDK service
> 
> Anand,
> 
> This only solves one problem out of many - dependency on rc.pvr Unless we rewrite the entirety of our custom weston init and runWeston scripts to become systemd units, we won't get all the fixes, workarounds and customizations we've added in the past years - calibration handling being the major of them...
> 
> --
> Denys
> 
> 
> On Mon, May 16, 2016 at 02:55:23PM +0530, Anand Balagopalakrishnan wrote:
> > - systemd starts Weston service much before DDK initialization
> > - Ensure that Weston service is started *after rc.pvr.service
> > 
> > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > ---
> >  .../wayland/weston-init/weston.service             |   16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service
> > 
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service
> > new file mode 100644
> > index 0000000..401c10e
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.service
> > @@ -0,0 +1,16 @@
> > +[Unit]
> > +Description=Weston Wayland compositor startup
> > +RequiresMountsFor=/run
> > +After=rc.pvr.service
> > +
> > +[Service]
> > +User=root
> > +EnvironmentFile=-/etc/default/weston
> > +Environment="XDG_RUNTIME_DIR=/run/user/root"
> > +ExecStartPre=/bin/mkdir -p /run/user/root
> > +ExecStartPre=/bin/chmod 0700 /run/user/root
> > +ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> > +
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

