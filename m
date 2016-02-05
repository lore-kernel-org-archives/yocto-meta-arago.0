Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8DFE452ABE
	for <meta-arago@arago-project.org>;
	Fri,  5 Feb 2016 15:53:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u15Fr9uC013545
	for <meta-arago@arago-project.org>; Fri, 5 Feb 2016 09:53:09 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u15Fr9js007509
	for <meta-arago@arago-project.org>; Fri, 5 Feb 2016 09:53:09 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Feb 2016 09:53:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u15Fr9T6032458;
	Fri, 5 Feb 2016 09:53:09 -0600
Date: Fri, 5 Feb 2016 10:52:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20160205155253.GS31480@edge>
References: <1454424195-11064-1-git-send-email-anandb@ti.com>
	<20160204183559.GO31480@edge> <56B44A9E.1090204@ti.com>
MIME-Version: 1.0
In-Reply-To: <56B44A9E.1090204@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Fri, 05 Feb 2016 15:53:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Anand,

Thanks. Then we need to add this line to the patch for tracking:

Upstream-Status: Pending

-- 
Denys


On Fri, Feb 05, 2016 at 12:39:18PM +0530, Anand Balagopalakrishnan wrote:
> Denys,
> 
> I plan to push the embedded patch to wayland-devel. We could have a
> rework of this patch based on comments.
> 
> Nonetheless, I have no doubt that this patch is indeed required. The
> current Weston code is not factoring in the embedded SoC
> configurations.
> 
> Regards,
> Anand
> 
> On Friday 05 February 2016 12:05 AM, Denys Dmytriyenko wrote:
> >Anand,
> >
> >Is this patch meant to be upstreamed? Or is this rather a hack for our
> >own setup? If latter, please add the patch to weston_1.9.0.bbappend in
> >meta-arago-distro instead of the main recipe. Thanks.
> >
> 

