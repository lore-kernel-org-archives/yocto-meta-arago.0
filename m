Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 992E3529E8
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2013 20:58:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7MKwgu2029787
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 15:58:42 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MKwg9J010277
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 15:58:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 15:58:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MKwgjh017929;
	Thu, 22 Aug 2013 15:58:42 -0500
Date: Thu, 22 Aug 2013 16:58:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20130822205841.GI25749@edge>
References: <CF956B779D819D41BBC043B7082161D5444C0B@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D5444C0B@DBDE04.ent.ti.com>
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
X-List-Received-Date: Thu, 22 Aug 2013 20:58:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 21, 2013 at 11:10:22AM +0000, Hingolikar, Mrinmayee wrote:
> Hi,
> 
> I am trying to create software manifest for the arago-glsdk filesystem using the create-manifest from arago-utils.
> On the host when I run the opkg-cl list-installed, it doesn't print any packages. I have built and installed opkg on the host from
> https://code.google.com/p/opkg/downloads/detail?name=opkg-0.2.0-rc1.tar.gz&can=2&q=.
> 
> Due to this I can only partially execute the create-manifest on the host.
> Any help?

You need the opkg-cl that gets built and installed in $TMPDIR/sysroots.

-- 
Denys

