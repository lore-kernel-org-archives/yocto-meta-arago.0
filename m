Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5DC6852A71
	for <meta-arago@arago-project.org>;
	Wed, 21 Oct 2015 13:52:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9LDqwuw006078;
	Wed, 21 Oct 2015 08:52:58 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9LDqwiZ021655;
	Wed, 21 Oct 2015 08:52:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 21 Oct 2015 08:52:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9LDqvkJ016782;
	Wed, 21 Oct 2015 08:52:57 -0500
Date: Wed, 21 Oct 2015 09:52:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <paul.barker@commagility.com>
Message-ID: <20151021135242.GQ5620@edge>
References: <20151021135037.200001e5@centos-7>
MIME-Version: 1.0
In-Reply-To: <20151021135037.200001e5@centos-7>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: meta-arago Fido branch
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
X-List-Received-Date: Wed, 21 Oct 2015 13:52:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 21, 2015 at 01:50:37PM +0100, Paul Barker wrote:
> Hi,
> 
> There isn't currently a 'fido' branch in the meta-arago repository. I'm now
> following 'fido' on all other layers, on meta-arago it's unclear whether I
> should take the commits after the ti2015.01 tag or not.
> 
> Would it be possible to add a 'fido' branch?

Paul,

meta-arago only tracks stable releases. Currently it's fido:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/README;hb=HEAD
http://arago-project.org/git/projects/?p=oe-layersetup.git;a=blob;f=configs/arago-fido-config.txt;hb=HEAD

-- 
Denys

