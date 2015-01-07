Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AAB86529E6
	for <meta-arago@arago-project.org>;
	Wed,  7 Jan 2015 18:21:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t07ILDBt016449
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 12:21:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07ILDsf008862
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 12:21:13 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 12:21:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07ILC3P016138;
	Wed, 7 Jan 2015 12:21:13 -0600
Date: Wed, 7 Jan 2015 13:21:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150107182112.GD4759@edge>
References: <1420549486-9379-1-git-send-email-a0393906@ti.com>
	<1420549486-9379-2-git-send-email-a0393906@ti.com>
	<20150106180301.GR4759@edge> <54AD2A44.9080607@ti.com>
MIME-Version: 1.0
In-Reply-To: <54AD2A44.9080607@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [WILINK R8.5 2/2] wl18xx, bt-firmware: Update to R8.5
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
X-List-Received-Date: Wed, 07 Jan 2015 18:21:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 07, 2015 at 06:14:52PM +0530, Karthik Ramanan wrote:
> On 06-Jan-15 11:33 PM, Denys Dmytriyenko wrote:
> >Karthik,
> >
> >You've dropped version from the filenames of all the WiLink components, but
> >updated PV only in ti-compat-wireless. All other packages will go back to 0.0
> >version due to missing PV. And since that version sorts lower, it won't be
> >installed on top of the old version.
> >
> 
> Denys,
> 
> Yes. This was intended, the decision was taken to drop the version
> names so that the recipes can be maintained in a easier manner.
> Note that PV is not defined in many of these recipes.
> 
> I agree with your comment about the issue arising out of this
> missing PV update but since this issue will not arise from a clean
> build and that we don't have any customer on the dra7xx-evm at the
> moment who is on daisy. Can this be patch be taken in the current
> state?

I'm fine dropping the version portion from the filename, but it has to have it 
in some way. Having recipe_X.Y.Z.bb is equivalent to having PV = "X.Y.Z" 
inside the recipe. So, this patch has to be updated to add PV to all the 
recipes, since the version no longer comes from the filename. Yes, many WiLink 
recipes don't have PV set explicitly, only because it was coming from the 
filename. So, either filename should provide the version or set PV explicitly.

And requiring a clean build to avoid any versioning issues is not a good 
strategy - we do interative builds on a nightly basis. Moreover, upgrade path 
at runtime will become an important matter soon with binary feeds provided to 
developers...

-- 
Denys

