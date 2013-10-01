Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6F3F5529A7
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:38:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91Dcser019073
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:38:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DcsY8025700
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:38:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 08:38:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DcrG0026730;
	Tue, 1 Oct 2013 08:38:53 -0500
Date: Tue, 1 Oct 2013 09:38:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131001133853.GG26572@edge>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-10-git-send-email-denis@denix.org>
	<A337C05E-E0C0-4D1E-B3BB-2BBA6D20F510@ti.com>
MIME-Version: 1.0
In-Reply-To: <A337C05E-E0C0-4D1E-B3BB-2BBA6D20F510@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 09/13] qt-provider.bbclass: class to allow seamless switching between Qt4 and Qt5
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
X-List-Received-Date: Tue, 01 Oct 2013 13:38:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 01, 2013 at 01:36:49PM +0000, Cooper Jr., Franklin wrote:
> Ack.
> 
> As a temp solution I can understand some of these classes being added to 
> meta-arago but in the long term will these patches be moved to meta-qt5?

Once they are tested in our environment, I was planning to offer them upstream :)


> > On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Recipes that need to compile against either Qt4 or Qt5 should inherit this class
> > instead of "inherit qt4e" or "inherit qt5" directly. Setting global QT_PROVIDER
> > to either "qt4e" or "qt5" will configure those recipes automatically.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > meta-arago-distro/classes/qt-provider.bbclass | 19 +++++++++++++++++++
> > 1 file changed, 19 insertions(+)
> > create mode 100644 meta-arago-distro/classes/qt-provider.bbclass
> > 
> > diff --git a/meta-arago-distro/classes/qt-provider.bbclass b/meta-arago-distro/classes/qt-provider.bbclass
> > new file mode 100644
> > index 0000000..444c76a
> > --- /dev/null
> > +++ b/meta-arago-distro/classes/qt-provider.bbclass
> > @@ -0,0 +1,19 @@
> > +# Class to handle switching between Qt4 and Qt5
> > +# Usage:
> > +# 1. Set QT_PROVIDER in distro config to either "qt4e" or "qt5"
> > +#    It defaults to "qt4e" when not set
> > +#    Hasn't been tested with "qt4x11" but should theoretically work
> > +# 2. Update recipes to inherit qt-provider instead of qt4e directly
> > +# 3. May need to use below QT_DEPENDS_* and QT_RDEPENDS_* variables
> > +#    instead of the actual Qt-version specific values
> > +
> > +QT_PROVIDER ?= "qt4e"
> > +
> > +inherit ${QT_PROVIDER}
> > +
> > +# Build-time dependencies
> > +QT_DEPENDS_BASE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase', 'qt4-embedded', d)}"
> > +QT_DEPENDS_WEBKIT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebkit', '', d)}"
> > +
> > +# Run-time dependencies
> > +QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-fonts', 'qt4-embedded-fonts', d)}"
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

