Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 44EDF529D3
	for <meta-arago@arago-project.org>;
	Thu,  4 Dec 2014 22:23:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB4MNXlv014974;
	Thu, 4 Dec 2014 16:23:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB4MNXbg025358;
	Thu, 4 Dec 2014 16:23:33 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Dec 2014 16:23:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB4MNWwB009004;
	Thu, 4 Dec 2014 16:23:32 -0600
Date: Thu, 4 Dec 2014 17:23:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: sujith h <sujith.h@gmail.com>
Message-ID: <20141204222332.GD5113@edge>
References: <CADyYWL=GZC866S5QWnYj-n1orTMjkeZn0YFak_GJ5PPiAiZDyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADyYWL=GZC866S5QWnYj-n1orTMjkeZn0YFak_GJ5PPiAiZDyw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Problem while building omap3-sgx-modules-x11_4.09.00.01 recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 22:23:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 03, 2014 at 03:38:51PM +0530, sujith h wrote:
> Hi,
> 
> When I try to build omap3-sgx-modules-x11_4.09.00.01.bb for core-image-sato
> image,
> 
> The kernel version that I use is 3.14.25. Is this recipe valid for kernel
> version 3.14? Any helping hand would be much appreciated.

No, that version is too old for kernel 3.14. You'd need to use 5.1.1.1 as 
there were some fixes specifically for 3.14 kernel API changes.

-- 
Denys

