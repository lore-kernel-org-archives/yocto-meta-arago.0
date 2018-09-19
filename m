Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 32B3F52A06
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 13:08:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JD8oTK032564
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 08:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537362530;
	bh=+0uw+ONuo5v3nc9yFO/fcKInzAPRqFS8mwFWOwAa5cQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=yYbq0TLSoHalV33UIxUwBeC6cp0WBXYIMB75z82CJLpjuBjKQC9egBqvrDyY3RDyw
	/uRWgmV5eLZiq/IdsNVkT3fO8AAFdvanEnpNgPM2F7/OnD/p4N2mLrjVipLByXBk75
	vK1uJ5e8P0mIYZ04kOHcCrH/0PlHOSvmcchAWEW0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JD8olD005694
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 08:08:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 08:08:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 08:08:50 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JD8oGB020342;
	Wed, 19 Sep 2018 08:08:50 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
	<1537301622-8988-3-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b69b7b54-deb4-1629-959e-a1d91e00d0e9@ti.com>
Date: Wed, 19 Sep 2018 09:08:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537301622-8988-3-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk 2/7] hector*: add hector-trajectory-server and its dependent packages
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
X-List-Received-Date: Wed, 19 Sep 2018 13:09:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/18/2018 4:13 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   recipes-ros/hector-slam/hector-map-tools_0.3.5.bb         | 8 ++++++++
>   recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb          | 8 ++++++++
>   recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb | 9 +++++++++
>   3 files changed, 25 insertions(+)
>   create mode 100644 recipes-ros/hector-slam/hector-map-tools_0.3.5.bb
>   create mode 100644 recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb
>   create mode 100644 recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb
>
> diff --git a/recipes-ros/hector-slam/hector-map-tools_0.3.5.bb b/recipes-ros/hector-slam/hector-map-tools_0.3.5.bb
> new file mode 100644
> index 0000000..4ac5a0c
> --- /dev/null
> +++ b/recipes-ros/hector-slam/hector-map-tools_0.3.5.bb
> @@ -0,0 +1,8 @@
> +DESCRIPTION = "hector_map_tools contains some functions related to accessing information from OccupancyGridMap maps."

There should be a short SUMMARY. The longer DESCRIPTION is optional.

> +SECTION = "devel"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://package.xml;beginline=17;endline=17;md5=d566ef916e9dedc494f5f793a6690ba5"
> +
> +DEPENDS = "nav-msgs libeigen"
> +
> +require recipes-ros/hector-slam/hector-slam.inc
> diff --git a/recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb b/recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb
> new file mode 100644
> index 0000000..e8c82c4
> --- /dev/null
> +++ b/recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb
> @@ -0,0 +1,8 @@
> +DESCRIPTION = "hector_nav_msgs contains messages and services used in the hector_slam stack."
> +SECTION = "devel"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://package.xml;beginline=16;endline=16;md5=d566ef916e9dedc494f5f793a6690ba5"
> +
> +DEPENDS = "cmake-modules nav-msgs geometry-msgs message-generation"
> +
> +require recipes-ros/hector-slam/hector-slam.inc
> diff --git a/recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb b/recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb
> new file mode 100644
> index 0000000..f6afe95
> --- /dev/null
> +++ b/recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb
> @@ -0,0 +1,9 @@
> +DESCRIPTION = "hector_trajectory_server  keeps track of tf trajectories extracted from tf data and \
> +               makes this data accessible via a service and topic"
> +SECTION = "devel"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://package.xml;beginline=16;endline=16;md5=d566ef916e9dedc494f5f793a6690ba5"
> +
> +DEPENDS = "cmake-modules tf roscpp hector-nav-msgs nav-msgs hector-map-tools"
> +
> +require recipes-ros/hector-slam/hector-slam.inc


