Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 27489529D7
	for <meta-arago@arago-project.org>;
	Thu, 15 Mar 2018 19:12:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2FJBo3f029324
	for <meta-arago@arago-project.org>; Thu, 15 Mar 2018 14:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521141110;
	bh=bmDJXISiEcW6FavUU8S71uI2fPUn5iqEX0cdGiilOQk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=B75HkgsESGA4ygzJBRSrWEr69bOZDIvDHI83cJaPszrIpSpDBZLkrDv/bNvtcWjyV
	xv4cjpVe4KyORydUGSzyPb2myZrJcNT+F699t4kqK6ls3UV8ZibFcHTadT8En4dJOS
	xvRendaZ0b0tJffkxVVd9FKIvTMqyFWTJTUH64bw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2FJBoIU020260
	for <meta-arago@arago-project.org>; Thu, 15 Mar 2018 14:11:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 15 Mar 2018 14:11:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 15 Mar 2018 14:11:50 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2FJBmoM005982;
	Thu, 15 Mar 2018 14:11:50 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1521070847-6029-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <523b4723-17a8-688b-d06b-4ab91ed284f1@ti.com>
Date: Thu, 15 Mar 2018 15:11:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521070847-6029-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] ros: mmwave: Update to latest ROS driver for mmwave radar
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
X-List-Received-Date: Thu, 15 Mar 2018 19:12:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Thank you.


On 3/14/2018 7:40 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../files/0001-CMakeLists-remote-rpath.patch       |  12 ----------
>   .../append_cfg/map_4ft_by_6ft_border_large.bt      | Bin 0 -> 1062 bytes
>   .../files/append_launch/plsdk_rviz_1443_3d.launch  |  26 +++++++++++++++++++++
>   .../files/append_launch/plsdk_rviz_1642_2d.launch  |  26 +++++++++++++++++++++
>   .../ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb      |  12 ++++++----
>   5 files changed, 60 insertions(+), 16 deletions(-)
>   delete mode 100644 recipes-ros/ros-mmwave/files/0001-CMakeLists-remote-rpath.patch
>   create mode 100644 recipes-ros/ros-mmwave/files/append_cfg/map_4ft_by_6ft_border_large.bt
>   create mode 100644 recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1443_3d.launch
>   create mode 100644 recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1642_2d.launch
>
> diff --git a/recipes-ros/ros-mmwave/files/0001-CMakeLists-remote-rpath.patch b/recipes-ros/ros-mmwave/files/0001-CMakeLists-remote-rpath.patch
> deleted file mode 100644
> index 4ad4996..0000000
> --- a/recipes-ros/ros-mmwave/files/0001-CMakeLists-remote-rpath.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> ---- CMakeLists.txt	2017-11-22 09:21:14.225928764 -0500
> -+++ CMakeLists_new.txt	2017-11-22 09:21:20.758046256 -0500
> -@@ -4,6 +4,9 @@
> - ## Add support for C++11, supported in ROS Kinetic and newer
> -  add_definitions(-std=c++11)
> -
> -+## Skip any hardcoded paths
> -+set(CMAKE_SKIP_RPATH true)
> -+
> - ## Find catkin macros and libraries
> - ## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
> - ## is used, also find other catkin packages
> diff --git a/recipes-ros/ros-mmwave/files/append_cfg/map_4ft_by_6ft_border_large.bt b/recipes-ros/ros-mmwave/files/append_cfg/map_4ft_by_6ft_border_large.bt
> new file mode 100644
> index 0000000000000000000000000000000000000000..7c13bde542ea671eb36c61e3d655f864a33c45eb
> GIT binary patch
> literal 1062
> zcma)3u};G<5Ixjp@zQ2sKj;DoK_CLLm4Tfi)k`<GacHDAMM*${KPh{W_!mAV5(5iT
> zI6DbWQlRK`_Px93_pWIVuP4c3F7D_aMpEK92u1XWelU})hkL%1GxXIUS)lMdJjTgX
> zgtrnWi}_rJNqmUo`vhlFJP>Cp>17lX4nm0{#vs8U-q~k87I=jPi-RYLC+8QZERr!g
> zN6s1ZL?RfxInaz0ibw~1zz={ysw<|dYF+J8A2@K$F;%l`GZ<;V6d)Z@4bC&P)}jMh
> z9xk^@lya9MQwBP+-})8KN6sBqUQuUzNXbcED_Gp(Mp>cEEi8(DiPS#ITXX2XAuh4O
> z%uS`Z2K`-Cn99JW>|WB*rmW09%UL<8%r<x#X1`G3a8*<9E9Wk7)y*gB`w-BPf1eU{
> zGO)n%398IdL8N_+m#ONU1_J23z>3Zlot@&&ky0}%rfMkYeSX^DJ^#aO^^4kTyK0rK
> e@?G7zj$Cln9$Co+cL~ciyqWPIm2c<PD|`V*jRP_O
>
> literal 0
> HcmV?d00001
>
> diff --git a/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1443_3d.launch b/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1443_3d.launch
> new file mode 100644
> index 0000000..df81d9a
> --- /dev/null
> +++ b/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1443_3d.launch
> @@ -0,0 +1,26 @@
> +<!--
> +  This file will launch rViz along with the mmWave sensor node and configure a TI mmWave 1443 sensor using a 3D config
> + -->
> +
> +<launch>
> +
> +  <!-- Call mmWave sensor launch file -->
> +  <include file="$(find ti_mmwave_rospkg)/launch/ti_mmwave_sensor.launch">
> +    <arg name="device" value="1443" doc="TI mmWave sensor device type [1443, 1642]"/>
> +    <arg name="config" value="3d" doc="TI mmWave sensor device configuration [3d (not supported by 1642 EVM), 2d]"/>
> +    <arg name="max_allowed_elevation_angle_deg" value="90" doc="Maximum allowed elevation angle in degrees for detected object data [0 > value >= 90]}"/>
> +    <arg name="max_allowed_azimuth_angle_deg" value="90" doc="Maximum allowed azimuth angle in degrees for detected object data [0 > value >= 90]}"/>
> +  </include>
> +
> +  <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
> +  <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_odom" args="0 0 0 0 0 0 map odom 100"/>
> +  <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 base_footprint base_radar_link 100"/>
> +
> +  <!-- Map server -->
> +  <node name="octomap_server" pkg="octomap_server" type="octomap_server_node" args="$(find ti_mmwave_rospkg)/cfg/map_4ft_by_6ft_border_large.bt projected_map:=map cloud_in:=no_input" />
> +  <node pkg="fake_localization" type="fake_localization" name="fake_localization">
> +    <param name="use_map_topic" value="true"/>
> +    <remap from="base_pose_ground_truth" to="odom"/>
> +  </node>
> +
> +</launch>
> diff --git a/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1642_2d.launch b/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1642_2d.launch
> new file mode 100644
> index 0000000..7e4ff78
> --- /dev/null
> +++ b/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1642_2d.launch
> @@ -0,0 +1,26 @@
> +<!--
> +  This file will launch rViz along with the mmWave sensor node and configure a TI mmWave 1642 sensor using a 2D config
> + -->
> +
> +<launch>
> +
> +  <!-- Call mmWave sensor launch file -->
> +  <include file="$(find ti_mmwave_rospkg)/launch/ti_mmwave_sensor.launch">
> +    <arg name="device" value="1642" doc="TI mmWave sensor device type [1443, 1642]"/>
> +    <arg name="config" value="2d" doc="TI mmWave sensor device configuration [3d (not supported by 1642 EVM), 2d]"/>
> +    <arg name="max_allowed_elevation_angle_deg" value="90" doc="Maximum allowed elevation angle in degrees for detected object data [0 > value >= 90]}"/>
> +    <arg name="max_allowed_azimuth_angle_deg" value="90" doc="Maximum allowed azimuth angle in degrees for detected object data [0 > value >= 90]}"/>
> +  </include>
> +
> +  <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
> +  <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_odom" args="0 0 0 0 0 0 map odom 100"/>
> +  <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 base_footprint base_radar_link 100"/>
> +
> +  <!-- Map server -->
> +  <node name="octomap_server" pkg="octomap_server" type="octomap_server_node" args="$(find ti_mmwave_rospkg)/cfg/map_4ft_by_6ft_border_large.bt projected_map:=map cloud_in:=no_
> +  <node pkg="fake_localization" type="fake_localization" name="fake_localization">
> +    <param name="use_map_topic" value="true"/>
> +    <remap from="base_pose_ground_truth" to="odom"/>
> +  </node>
> +
> +</launch>
> diff --git a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb
> index 87c5aac..9a984f5 100644
> --- a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb
> +++ b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_0.1.0.bb
> @@ -1,11 +1,13 @@
>   DESCRIPTION = "This package contains ROS driver for mmWave TI sensor."
>   SECTION = "devel"
>   LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=6ee5d8ff5204a889d79a1ffd1812b3c1"
>   
> -SRC_URI[base.md5sum] = "f48fe4a1e654f359382fc617667f33c0"
> -SRC_URI[base.sha256sum] = "72b424a1c7568b04f1b583ef46d7716c10f77a0d05f4e950ac6d70991427a073"
> -SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_0_0/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p2.zip;name=base;subdir=${P}"
> +LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=da4f1cae75b0590538edcb7e23a325d8"
> +SRC_URI[base.md5sum] = "e85370690db8652d9d706aa77facce6a"
> +SRC_URI[base.sha256sum] = "1c88f501f5e9827299b8172d5895e54cb0178a65879f1d1092761cfe0e48bae4"
> +SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_1_1/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p2p1.zip;name=base;subdir=${P}"
> +SRC_URI += "file://append_launch"
> +SRC_URI += "file://append_cfg"
>   
>   # do not use rpath
>   EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
> @@ -23,6 +25,8 @@ do_install_append() {
>        cp ${S}/mmWave_nodelets.xml ${D}${ros_datadir}/ti_mmwave_rospkg/
>        cp -r ${S}/cfg ${D}${ros_datadir}/ti_mmwave_rospkg/
>        cp -r ${S}/launch ${D}${ros_datadir}/ti_mmwave_rospkg/
> +     cp  ${WORKDIR}/append_launch/*.launch  ${D}${ros_datadir}/ti_mmwave_rospkg/launch/.
> +     cp  ${WORKDIR}/append_cfg/*.bt  ${D}${ros_datadir}/ti_mmwave_rospkg/cfg/.
>   }
>   
>   FILES_${PN} += "${ros_libdir}/ti_mmwave_rospkg"


