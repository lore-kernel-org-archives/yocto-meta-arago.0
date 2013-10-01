Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 41DAC52990
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:24:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DO6J5026132
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:24:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DO6Gt005022
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:24:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 08:24:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DO6JU016805;
	Tue, 1 Oct 2013 08:24:06 -0500
Date: Tue, 1 Oct 2013 09:24:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131001132405.GD26572@edge>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-14-git-send-email-denis@denix.org>
	<8778D9F4-AC13-4D36-908F-922789671691@ti.com>
MIME-Version: 1.0
In-Reply-To: <8778D9F4-AC13-4D36-908F-922789671691@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 13/13] arago-qt5-image: add test minimal image for testing Qt5 migration
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
X-List-Received-Date: Tue, 01 Oct 2013 13:24:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 01, 2013 at 12:50:57PM +0000, Cooper Jr., Franklin wrote:
> I'm not sure if Matrix is a useful application to include I'm this test 
> image. The backend for Matrix isn't included and no Matrix apps will be 
> installed so I'm assuming all this would do is open a white Window.

It's a full WebKit-based browser, similar to one of the examples. You call it 
with an URL and it loads and renders that page. Tried it on http://google.com


> Why not include something like the thermostat demo which is a much full 
> featured demo based on QWidgets and is probably our best means to discover 
> any potential problems.

Sure, why not :)

-- 
Denys


> > On Oct 1, 2013, at 2:17 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > .../recipes-core/images/arago-qt5-image.bb             | 18 ++++++++++++++++++
> > 1 file changed, 18 insertions(+)
> > create mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-image.bb
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/arago-qt5-image.bb b/meta-arago-distro/recipes-core/images/arago-qt5-image.bb
> > new file mode 100644
> > index 0000000..7d8ced9
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/images/arago-qt5-image.bb
> > @@ -0,0 +1,18 @@
> > +# Arago TI SDK base image
> > +# gives you an image with Qt/E and other common packages shared by all TI SDKs.
> > +
> > +require arago-image.inc
> > +inherit remove-net-rules
> > +
> > +COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-a15"
> > +
> > +IMAGE_INSTALL += "\
> > +    packagegroup-arago-base \
> > +    packagegroup-arago-console \
> > +    packagegroup-arago-base-tisdk \
> > +    matrix-gui-browser \
> > +    qtwebkit-examples-examples \
> > +    qtbase-plugins \
> > +    "
> > +
> > +export IMAGE_BASENAME = "arago-qt5-image"
> > -- 
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

