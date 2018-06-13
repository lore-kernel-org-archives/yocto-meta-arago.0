Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 71A2E52978
	for <meta-arago@arago-project.org>;
	Wed, 13 Jun 2018 15:03:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5DF3577000340
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 10:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528902185;
	bh=1y2Gl7xIzwfhS1DQ43BIm/7YRLLTvocRZ+elarkhccU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ucUohvv1xkRIjAx2cZEXeYbNt15hvXO0ppSWdR+HPI4bFnwNWdUtIDP0Kmj1qhsOR
	sF5Tntf/Z9m813rdMBVwnCgbnFaVww6hSo7T6qKDQ539L36bwHr1O8lw3LYY0BRcZV
	5hZPuz1Vk1/rpqQDllLPgg4ldD5SuWSJZJET9PLE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DF35Eb024361
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 10:03:05 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 13 Jun 2018 10:03:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 13 Jun 2018 10:03:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DF35v7008622;
	Wed, 13 Jun 2018 10:03:05 -0500
Date: Wed, 13 Jun 2018 11:01:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Prasad, Ram" <x0038811@ti.com>
Message-ID: <20180613150153.GB3859@beryl>
References: <1528778710-2395-1-git-send-email-x0038811@ti.com>
	<20180612213658.GB5417@beryl>
	<14bb9e4323dd412485ea202cefbf9084@ti.com>
MIME-Version: 1.0
In-Reply-To: <14bb9e4323dd412485ea202cefbf9084@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko V2 0/2] gstreamer 1.12 patches
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
X-List-Received-Date: Wed, 13 Jun 2018 15:03:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, merged.

On Tue, Jun 12, 2018 at 11:30:14PM -0400, Prasad, Ram wrote:
> Hi Denys,
> I updated meta-arago commit-messages in V2 with proper wordings so that it 
> clearly tells what has changed. This is the only change wrt V1
> 
> Thanks
> Ramprasad
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, June 13, 2018 3:07 AM
> To: Prasad, Ram
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [rocko V2 0/2] gstreamer 1.12 patches
> 
> Sorry for the delay.
> What are the differences from v1?
> 
> 
> On Tue, Jun 12, 2018 at 10:15:08AM +0530, Ramprasad N wrote:
> > Update SRCREV of gst-vpe and gst-ducati with latest commits
> > 
> > Ramprasad N (2):
> >   gstvpe: Bump SRCREV with latest fixes
> >   gst-ducati: Update SRCREV with latest commit
> > 
> >  .../gstreamer1.0-plugins-ducati_git.bb             |  4 +--
> >  ...late-the-output-structure-with-progressiv.patch | 33 ----------------------
> >  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  5 ++--
> >  3 files changed, 4 insertions(+), 38 deletions(-)
> >  delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch
> > 
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

