Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2136F52ADF
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 20:28:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7KKS7iO018965;
	Mon, 20 Aug 2018 15:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534796887;
	bh=LspxSwmY+Xjc6pry69SL+eh//6AjCMFR/k2NyQJc7XY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=is5sCeFO4tX16TRQ80MUIsdjUe/GfMCZPG+Ff51iLHQTl36FZFZyUA8yQslTSC5rA
	VnTPKMENkfH4rSGyR4cMojEq++EYy7YKnef0ZEFjdu5k60EcLAfbL4Obezgk546vda
	QhGSf0+OoCnMO1sA7z++IX95jCSvH4cthc9g/3as=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KKS7kx031044;
	Mon, 20 Aug 2018 15:28:07 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 20 Aug 2018 15:28:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 20 Aug 2018 15:28:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KKS5Xi024717;
	Mon, 20 Aug 2018 15:28:06 -0500
Date: Mon, 20 Aug 2018 16:27:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20180820202705.GG29422@beryl>
References: <1534756947-24631-1-git-send-email-ankur.tyagi85@gmail.com>
	<20180820182615.GC29422@beryl>
	<CADySD0GJ7Z7F7RTbptJD_MUpO=OY6LwZ8Vo9wNgPVrFPyd1nxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GJ7Z7F7RTbptJD_MUpO=OY6LwZ8Vo9wNgPVrFPyd1nxQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/sumo/master/][PATCH] meta-toolchain-arago-qte: fix TOOLCHAIN_TARGET_TASK
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
X-List-Received-Date: Mon, 20 Aug 2018 20:28:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2018 at 07:25:56AM +1200, Ankur Tyagi wrote:
> I get this error when running following bitbake command
> 
> MACHINE=am335x-evm bitbake -k meta-toolchain-arago-qte
> NOTE: Started PRServer with DBfile:
> /home/ankur/arago/rocko/oe-layersetup/build/cache/prserv.sqlite3, IP:
> 127.0.0.1, PORT: 43505, PID: 4653
> Loading cache: 100%
> |########################################################################################################################################################################|
> Time: 0:00:00
> Loaded 3529 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'packagegroup-arago-qt5-toolchain-target'
> 
> Searched for this package in meta-arago repo also and couldn't found it
> 
> ankur@ankur-Latitude-E6520:~/arago/rocko/oe-layersetup/sources/meta-arago$
> find . -name "packagegroup-arago-qt5-toolchain-target.bb"
> ankur@ankur-Latitude-E6520:~/arago/rocko/oe-layersetup/sources/meta-arago$
> 
> Moreover, meta-toolchain-arago-tisdk.bb also includes
> 'packagegroup-arago-qte-toolchain-target'
> 
> packagegroup-arago-qte-toolchain-target.bb includes correct Qt packages
> depending upon 'QT_PROVIDER'

Ah, looking closer, I think you are right. Thanks for spotting it - I'll give 
it a try.


> Hence this patch.
> 
> Regards
> Ankur
> 
> On Tue, Aug 21, 2018 at 6:27 AM Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > NAK - this is incorrect.
> >
> >
> > On Mon, Aug 20, 2018 at 09:22:27PM +1200, Ankur Tyagi wrote:
> > > Resolves following error when building meta-toolchain-arago-qte
> > > ERROR: Nothing RPROVIDES 'packagegroup-arago-qt5-toolchain-target'
> >
> > When and how are you getting this error?
> >
> >
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arago-extras/recipes-core/meta/
> > meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/
> > meta-toolchain-arago-qte.bb
> > > index fdca2c3..0e0e057 100644
> > > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > > @@ -1,6 +1,6 @@
> > >  # Qt Embedded toolchain
> > >  TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-qte-toolchain-host"
> > > -TOOLCHAIN_TARGET_TASK ?= "${@base_conditional('QT_PROVIDER', 'qt5',
> > 'packagegroup-arago-qt5-toolchain-target',
> > 'packagegroup-arago-qte-toolchain-target', d)}"
> > > +TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-qte-toolchain-target"
> > >  TOOLCHAIN_SUFFIX ?= "-qte-sdk"
> > >
> > >  require meta-toolchain-arago.bb
> > > --
> > > 2.7.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

