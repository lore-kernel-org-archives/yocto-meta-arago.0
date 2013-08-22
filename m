Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 848DF529E8
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2013 20:56:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7MKu8ZF029564
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 15:56:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MKu8ew005956
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 15:56:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 15:56:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MKu8sj002047;
	Thu, 22 Aug 2013 15:56:08 -0500
Date: Thu, 22 Aug 2013 16:56:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130822205607.GH25749@edge>
References: <CF956B779D819D41BBC043B7082161D5444C0B@DBDE04.ent.ti.com>
	<4D91A5AA-3AF5-4ADE-ABC3-E9173655520B@ti.com>
MIME-Version: 1.0
In-Reply-To: <4D91A5AA-3AF5-4ADE-ABC3-E9173655520B@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: opkg-cl for manifest creation
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
X-List-Received-Date: Thu, 22 Aug 2013 20:56:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 21, 2013 at 12:48:19PM +0000, Cooper Jr., Franklin wrote:
> Any reason why you can't use the tisdk-image class in meta-arago-distro. 
> This class will create the entire manifest for you.
> 
> You can look at arago-amsdk-image for an example.

Franklin,

Not everyone uses the combined image. As a matter of fact, AMSDK is the only 
consumer of it, while both MCSDK and GLSDK are doing it differently.

-- 
Denys


> On Aug 21, 2013, at 6:10 AM, "Hingolikar, Mrinmayee" <mrinmayee@ti.com<mailto:mrinmayee@ti.com>> wrote:
> 
> Hi,
> 
> I am trying to create software manifest for the arago-glsdk filesystem using the create-manifest from arago-utils.
> On the host when I run the opkg-cl list-installed, it doesn’t print any packages. I have built and installed opkg on the host from
> https://code.google.com/p/opkg/downloads/detail?name=opkg-0.2.0-rc1.tar.gz&can=2&q=.
> 
> Due to this I can only partially execute the create-manifest on the host.
> Any help?
> 
> Regards,
> Mrinmayee
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


