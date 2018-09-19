Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4EDB552A06
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 19:35:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JJZWIx126026
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 14:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537385733;
	bh=DWTtdNvtufcA3An4T7FDskWIlR8ABhdj5QiFU7YCCSU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=jqJ74XdjcfjgybnNUbK8HSYMDYQghjv5yiZKRswKQNhvespRyX3O0nmSy2/M0NY74
	3aqS7/4zEiNYaaq+9gJ7Tp/l1BbuVdhjWvo7Z4UTdVF5UaKVw85/dYPJoeW4HspIbd
	+ZWbH3KMr9zjcE1aZlH7iYVxx2gaRHS9G/lAbDek=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JJZWiv008625
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 14:35:32 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 14:35:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 14:35:32 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JJZWXr006476;
	Wed, 19 Sep 2018 14:35:32 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8b82b1e3-6a49-d4bf-a3ca-b9c6a5a17f87@ti.com>
Date: Wed, 19 Sep 2018 15:35:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537301622-8988-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk 0/7] Add ROS navigation demo with obstacle avoidance
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
X-List-Received-Date: Wed, 19 Sep 2018 19:35:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

These are pushed. Thank you.

- Jake


On 9/18/2018 4:13 PM, Hongmei Gou wrote:
> The major changes include:
> * Update mmwave-ros-pkg-master to version 2.5.1
> * Add hector-trajectory-server and its dependent packages
> * Add patches for rotate-recovery and move-base
> * Add mmwave-ros-autonomous-robotics package
>
> Hongmei Gou (7):
>    mmwave-ros-pkg-master: version update and add setup.bash
>    hector*: add hector-trajectory-server and its dependent packages
>    packagegroup-ros-world: add hector* packages
>    rotate-recovery: add patch for ROS navigation demo
>    move-base: add patch for ROS navigation demo
>    mmwave-ros-autonomous-robotics: added for ROS navigation demo with
>      obstacle avoidance
>    packagegroup-ros-ti: add mmwave-ros-autonomous-robotics demo
>
>   .../hector-map-tools_0.3.5.bb}                     |  34 +----
>   .../hector-nav-msgs_0.3.5.bb}                      |  34 +----
>   .../hector-trajectory-server_0.3.5.bb}             |  35 +----
>   ...navigation-rotate-recovery-mmwave-changes.patch |  88 ++++++++++++
>   .../0002-navigation-move-base-mmwave-changes.patch |  22 +++
>   .../move-base_1.12.14.bbappend}                    |  13 +-
>   .../rotate-recovery_1.12.14.bbappend}              |  13 +-
>   recipes-ros/packagegroups/packagegroup-ros-ti.bb   |   3 +
>   ...p-ros-ti.bb => packagegroup-ros-world.bbappend} |  15 +-
>   ...-turtlebot-bringup-description-launch-xml.patch |  12 ++
>   ...e-launchers-navigation-visualization-rviz.patch | 151 +++++++++++++++++++++
>   ...-turtlebot-navigation-costmap-params-yaml.patch |  22 +++
>   .../0002-turtlebot-bringup-minimal-launch.patch    |  26 ++++
>   recipes-ros/ros-mmwave/files/setup.bash            |   9 ++
>   ....bb => mmwave-ros-autonomous-robotics_2.5.1.bb} |  63 ++++++---
>   ...ter_0.1.0.bb => mmwave-ros-pkg-master_2.5.1.bb} |  18 ++-
>   16 files changed, 411 insertions(+), 147 deletions(-)
>   copy recipes-ros/{ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb => hector-slam/hector-map-tools_0.3.5.bb} (2%)
>   copy recipes-ros/{ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb => hector-slam/hector-nav-msgs_0.3.5.bb} (2%)
>   copy recipes-ros/{ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb => hector-slam/hector-trajectory-server_0.3.5.bb} (2%)
>   create mode 100644 recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch
>   create mode 100644 recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch
>   copy recipes-ros/{packagegroups/packagegroup-ros-ti.bb => navigation/move-base_1.12.14.bbappend} (1%)
>   copy recipes-ros/{packagegroups/packagegroup-ros-ti.bb => navigation/rotate-recovery_1.12.14.bbappend} (1%)
>   copy recipes-ros/packagegroups/{packagegroup-ros-ti.bb => packagegroup-ros-world.bbappend} (1%)
>   create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-bringup-description-launch-xml.patch
>   create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch
>   create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch
>   create mode 100644 recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch
>   create mode 100644 recipes-ros/ros-mmwave/files/setup.bash
>   copy recipes-ros/ros-mmwave/{mmwave-ros-pkg-master_0.1.0.bb => mmwave-ros-autonomous-robotics_2.5.1.bb} (5%)
>   rename recipes-ros/ros-mmwave/{mmwave-ros-pkg-master_0.1.0.bb => mmwave-ros-pkg-master_2.5.1.bb} (69%)
>


