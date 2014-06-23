Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4C274529C8
	for <meta-arago@arago-project.org>;
	Mon, 23 Jun 2014 20:33:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5NKXA26032636
	for <meta-arago@arago-project.org>; Mon, 23 Jun 2014 15:33:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5NKXA2c014905
	for <meta-arago@arago-project.org>; Mon, 23 Jun 2014 15:33:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 23 Jun 2014 15:33:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5NKX7k6028830	for
	<meta-arago@arago-project.org>; Mon, 23 Jun 2014 15:33:09 -0500
Date: Mon, 23 Jun 2014 16:33:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140623203304.GF6700@edge>
References: <20140616224438.GD1825@edge>
MIME-Version: 1.0
In-Reply-To: <20140616224438.GD1825@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Daisy migration
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
X-List-Received-Date: Mon, 23 Jun 2014 20:33:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 16, 2014 at 06:44:38PM -0400, Denys Dmytriyenko wrote:
> All,
> 
> Just a heads up about current work being performed migrating meta-arago master 
> branch from Dora stable release to the next one called Daisy. Some instability 
> in the process may occur. Please also update your configs, if necessary.

All,

With the patches submitted so far, meta-arago master is mostly ready to be 
used with Daisy maintenance release of oe-core and other layers.

Please note, "tisdk" combined images are currently broken, as underlying image 
and rootfs classes have changed significantly. So, for now it is best to build 
rootfs image and linux-devkit separately.

Please let me know of any question.

-- 
Denys

