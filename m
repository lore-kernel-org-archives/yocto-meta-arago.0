Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 437E552AC8
	for <meta-arago@arago-project.org>;
	Tue, 25 May 2021 23:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E1C8340A46;
	Tue, 25 May 2021 23:35:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yFwlxADyT4u5; Tue, 25 May 2021 23:35:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C250340A28;
	Tue, 25 May 2021 23:35:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1DD671745B0; Tue, 25 May 2021 19:35:10 -0400 (EDT)
Date: Tue, 25 May 2021 19:35:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210525233510.GE1528@denix.org>
References: <20210525160019.28175-1-denys@konsulko.com>
	<20210525160305.d2v7kora7kbi2rm6@during>
MIME-Version: 1.0
In-Reply-To: <20210525160305.d2v7kora7kbi2rm6@during>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH] linuxptp: update bbappend against latest upstream
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
X-List-Received-Date: Tue, 25 May 2021 23:34:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 11:03:05AM -0500, Nishanth Menon wrote:
> On 11:00-20210525, Denys Dmytriyenko wrote:
> > Back-porting upstream patch for dunfell. The dunfell linux-ptp is
> > still at 2.0. This forks linuxptp to 3.0 to update it for the linux
> > ptp fixes done on meta-openembedded
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > Cc: Lokesh Vutla <lokeshvutla@ti.com>
> > ---
> >  .../recipes-connectivity/linuxptp/linuxptp_%.bbappend       | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> > index b0552aaf..e4fb109a 100644
> > --- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> > +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> > @@ -1,13 +1,13 @@
> >  PR_append = ".arago0"
> > -PV_append = "+git${SRCPV}"
> > +PV = "3.0+git${SRCPV}"
> >  
> >  BRANCH = "ti-linuxptp"
> > -SRCREV = "a06698a12e828a0372955c2d9c8d6604d8326811"
> > +SRCREV = "f155c21283a0421f5e1e0b5e850c8a9a71d72453"
> >  
> >  SRC_URI = " \
> >      git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
> >      file://build-Allow-CC-and-prefix-to-be-overriden.patch \
> > -    file://no-incdefs-using-host-headers.patch \
> > +    file://Use-cross-cpp-in-incdefs.patch \
> >  "
> >  
> >  S = "${WORKDIR}/git"
> > -- 
> > 2.17.1
> > 
> 
> Nitpicking on $subject..
> http://arago-project.org/git/meta-arago.git?p=meta-arago.git;a=blobdiff;f=meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%25.bbappend;h=e4fb109a5b1dcc16e52aec24c61386fde1e871df;hp=b0552aaf41528735a697946f60a432378d6c5cb8;hb=dc1101ed36094749219285378a73f660255e3cbd;hpb=df231e190a3c138696c15faa88f7cb228c2cc585
> is already on master, so just dunfell alone.
> 
> Acked-by: Nishanth Menon <nm@ti.com>

BTW, this was NOT sent by me! The original patch for master was mine and I do 
understand how this might have happened. But that is not the proper way to 
retain original authorship - please set your git config properly. :)

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

