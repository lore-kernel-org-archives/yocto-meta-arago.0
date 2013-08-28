Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2AE28529C9
	for <meta-arago@arago-project.org>;
	Wed, 28 Aug 2013 23:13:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7SNDLft024841
	for <meta-arago@arago-project.org>; Wed, 28 Aug 2013 18:13:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7SNDL5s006456
	for <meta-arago@arago-project.org>; Wed, 28 Aug 2013 18:13:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 28 Aug 2013 18:13:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7SNDKRh029011;
	Wed, 28 Aug 2013 18:13:21 -0500
Date: Wed, 28 Aug 2013 19:13:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>
Message-ID: <20130828231319.GB5880@edge>
References: <8EAE6244CE843044A42356038645C85515756934@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8EAE6244CE843044A42356038645C85515756934@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Turning off optimization from recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 23:13:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 28, 2013 at 10:45:58PM +0000, Saran, Sajesh Kumar wrote:
> Hi,
> 
> I have a autotool based project. I need to turn off its optimization from its bitbake recipe.
> Yocto/some root config is adding -O2 by default and I need to change it to -O0 for a particular recipe.
> Is there any bitbake flag to change optimization option from recipe?

SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-O2", "-O0")}"

-- 
Denys

