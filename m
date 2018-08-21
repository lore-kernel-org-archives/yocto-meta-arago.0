Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8CB0B529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 21:45:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LLj6Te078367
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 16:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534887906;
	bh=FEOlBMBIX6CwGcaoMVBzHVVagJi3YBJz4EsvYV5zyT0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Sm1AVh6JJSD7v57xYXOf/SWVKv5oOnKESKguV99aoqzVP6WDqGmZ1z9WEc4n2uL6N
	xIPUXn+bLmdOk7EvCaBTrkDtqKCSAVR/Mq7i2YFi6rHc67HGBkCdYj2dJCBHkyJAps
	KOa81WTGKAmzBy3vjb1n2x708+gRy0ckqYdXC53o=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LLj6GK015250
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 16:45:06 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 16:45:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 16:45:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LLj6PK020532;
	Tue, 21 Aug 2018 16:45:06 -0500
Date: Tue, 21 Aug 2018 17:44:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180821214410.GX29422@beryl>
References: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
	<1534878837-20469-3-git-send-email-j-stiffler@ti.com>
	<20180821214044.GW29422@beryl>
MIME-Version: 1.0
In-Reply-To: <20180821214044.GW29422@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/3] packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 21:45:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2018 at 05:40:44PM -0400, Denys Dmytriyenko wrote:
> On Tue, Aug 21, 2018 at 03:13:56PM -0400, Jacob Stiffler wrote:
> > * Add the secondary toolchain to the devkit
> >  if SECONDARY_TOOLCHAIN_ARCH is defined.
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-cross-canadian.bbappend      | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
> > new file mode 100644
> > index 0000000..f02dfd9
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
> > @@ -0,0 +1,8 @@
> > +PR_append = ".arago0"
> > +
> > +SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
> > +                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
> 
> Since this is a bbappend, it will come into play for internal toolchain as 
> well, but in that case SECONDARY_TARGET_ARCH won't be set.
> 
> You might want to do something like this:
> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-devtools/gcc/gcc_%25.bbappend;hb=HEAD

Or you can simply set it empty here if not already set.

SECONDADRY_TARGET_ARCH ?= ""


> > +RDEPENDS_${PN}_append = " \
> > +    ${@base_conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
> > +"
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

